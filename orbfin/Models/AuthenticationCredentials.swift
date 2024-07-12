//
//  Authentication.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

struct AuthenticationCredentials {
    @AppStorage("access_token") var accessToken: String?
    @AppStorage("refresh_token") var refreshToken: String?
    @AppStorage("username") var username: String?
    
    var isValid: Bool {
        return !(accessToken?.isEmpty ?? true) && !(refreshToken?.isEmpty ?? true) && !(username?.isEmpty ?? true)
    }
}
