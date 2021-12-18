//
//  SignUpPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import Foundation
import UIKit

protocol SignUpPresenterProtocol: AnyObject {
    func signupButtonTapped(name: String, phone: String, username: String, password: String)
    init(view: SignUpViewController)
}

class SignUpPresenter: SignUpPresenterProtocol {
    private let group = DispatchGroup()
    private var errorOccured: Bool
    
    var view: SignUpViewController?
    
    required init(view: SignUpViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func signupButtonTapped(name: String, phone: String, username: String, password: String) {
        var request = URLRequest(url: URL(string: "http://localhost:8080/auth/register")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "userName": username,
            "password": password,
            "name": name,
            "phone": phone,
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        group.enter()
        let task = URLSession.shared.dataTask(with: request) { _, response, error in
            guard error == nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if (httpResponse.statusCode != 200) {
                    self.errorOccured = true
                    print("UNSUCCESSFUL WITH CODE: \(httpResponse.statusCode)")
                }
            }
            self.group.leave()

        }
        task.resume()
        
        group.notify(queue: .main) { [weak self] in
            if (self?.errorOccured != nil && self?.errorOccured == true) {
                self?.view?.showAlert()
                return
            }
            self?.navigateToMainScreen()
        }
    }
    
    func navigateToMainScreen() {
        let view = MainScreenViewController()
        view.modalPresentationStyle = .fullScreen
        self.view?.present(view, animated: false, completion: nil)
    }
}
