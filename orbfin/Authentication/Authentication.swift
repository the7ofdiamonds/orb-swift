//
//  Authentication.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

@MainActor
class Authentication: ObservableObject {
    @AppStorage("access_token") var accessToken: String?
    @AppStorage("refresh_token") var refreshToken: String?
    @AppStorage("username") var username: String?
    @AppStorage("lastView") var lastView: String?

    var isValid: Bool {
        guard let accessToken = accessToken, !accessToken.isEmpty,
              let refreshToken = refreshToken, !refreshToken.isEmpty,
              let username = username, !username.isEmpty else {
            return false
        }
        
        return true
    }
    
    func checkAuthentication() -> Bool {
        return isValid
    }
    
    func saveAuthentication(responseLogin: ResponseLogin) async -> Bool {
        self.accessToken = responseLogin.accessToken
        self.refreshToken = responseLogin.refreshToken
        self.username = responseLogin.username
            
        return checkAuthentication()
    }
    
    func removeAuthentication() async -> Bool {
        self.lastView = Page.home.title
        self.accessToken = nil
        self.refreshToken = nil
        
        return checkAuthentication()
    }
}
