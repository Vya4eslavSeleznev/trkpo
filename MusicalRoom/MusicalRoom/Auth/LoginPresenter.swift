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
    var view: LoginViewController?
    
    required init(view: LoginViewController) {
        self.view = view
    }
    
    func loginButtonTapped(username: String, password: String) {
        //check data and navigate to main screen
    }
}
