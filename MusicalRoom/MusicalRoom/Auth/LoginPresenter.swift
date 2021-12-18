//
//  LoginPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func loginButtonTapped(username: String, password: String)
    init(view: LoginViewController)
}

class LoginPresenter: LoginPresenterProtocol {
    private let group = DispatchGroup()
    
    var view: LoginViewController?
    
    required init(view: LoginViewController) {
        self.view = view
    }
    
    func loginButtonTapped(username: String, password: String) {
        var request = URLRequest(url: URL(string: "http://localhost:8080/auth/signin")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "userName": username,
            "password": password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        group.enter()
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(SignInResponse.self, from: data)
                print(response.token)
            } catch {
                //fixme alertMessage
                print(error)
                return
            }
            self.group.leave()

        }
        task.resume()
        
        group.notify(queue: .main) { [weak self] in
            self?.navifateToMainScreen()
        }
    }
    
    func navifateToMainScreen() {
        let view = MainScreenViewController()
        view.modalPresentationStyle = .fullScreen
        self.view?.present(view, animated: false, completion: nil)
    }
}
