//
//  SignUpPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import Foundation

protocol SignUpViewPresenterProtocol: AnyObject {
    func signupButtonTapped(name: String, phone: String, username: String, password: String)
    init(view: SignUpViewController)
}

class SignUpViewPresenter: SignUpViewPresenterProtocol {
    var view: SignUpViewController?
    
    required init(view: SignUpViewController) {
        self.view = view
    }
    
    func signupButtonTapped(name: String, phone: String, username: String, password: String) {
        // todo работа с сервером
    }
}
