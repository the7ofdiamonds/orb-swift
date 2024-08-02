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
    
    func saveAuthentication(accessToken: String, refreshToken: String, username: String) async -> Bool {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.username = username
            
        return checkAuthentication()
    }
    
    func removeAuthentication() async -> Bool {
        self.lastView = "Home"
        self.accessToken = nil
        self.refreshToken = nil
        print(lastView ?? "Np Value")
        return checkAuthentication()
    }
}
