//
//  ResponseLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import Foundation

struct ResponseLogin: Codable {
    var successMessage: String?
    var errorMessage: String?
    var username: String?
    var accessToken: String?
    var refreshToken: String?
}
