//
//  ReservePresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 19.12.2021.
//

import Foundation

protocol ReservePresenterProtocol: AnyObject {
    func reserveButtonTapped()
    init(view: ReserveViewController)
}

class ReservePresenter: ReservePresenterProtocol {
    private let group = DispatchGroup()
    private var errorOccured: Bool
    
    var view: ReserveViewController?
    
    required init(view: ReserveViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func reserveButtonTapped() {
        //todo
    }
}
