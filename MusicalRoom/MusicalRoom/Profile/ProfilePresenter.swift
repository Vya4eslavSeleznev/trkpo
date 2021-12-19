//
//  ProfilePresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 19.12.2021.
//

import Foundation

protocol ProfilePresenterProtocol: AnyObject {
    func updateButtonTapped(name: String, phone: String, username: String, password: String)
    init(view: ProfileViewController)
}

class ProfilePresenter: ProfilePresenterProtocol {
    var view: ProfileViewController?
    private var errorOccured: Bool
    
    required init(view: ProfileViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func updateButtonTapped(name: String, phone: String, username: String, password: String) {
        
    }
}
