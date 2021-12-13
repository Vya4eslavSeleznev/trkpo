//
//  SignUpPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import Foundation

protocol SignUpPresenterProtocol: AnyObject {
    func signupButtonTapped(name: String, phone: String, username: String, password: String)
    init(view: SignUpViewController)
}

class SignUpPresenter: SignUpPresenterProtocol {
    var view: SignUpViewController?
    
    required init(view: SignUpViewController) {
        self.view = view
    }
    
    func signupButtonTapped(name: String, phone: String, username: String, password: String) {
        // todo работа с сервером
    }
}
