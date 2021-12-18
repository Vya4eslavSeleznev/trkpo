//
//  SignInResponse.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 18.12.2021.
//

import Foundation

struct SignInResponse: Codable {
    var id: Int
    var token: String
    var userName: String
}
