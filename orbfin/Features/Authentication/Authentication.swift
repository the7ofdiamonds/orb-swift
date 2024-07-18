//
//  Authentication.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

@MainActor
class Authentication: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    init() {
        self.isLoggedIn = checkAuthentication()
    }
    
    func checkAuthentication() -> Bool {
        let credentials = AuthenticationCredentials()
        self.isLoggedIn = credentials.isValid
        return credentials.isValid
    }
    
    func saveAuthentication(responseLogin: ResponseLogin) async -> Bool {
        if let accessToken = responseLogin.accessToken,
           let refreshToken = responseLogin.refreshToken,
           let username = responseLogin.username {
            let credentials = AuthenticationCredentials()

            credentials.accessToken = accessToken
            credentials.refreshToken = refreshToken
            credentials.username = username
            
            self.isLoggedIn = credentials.isValid
            
            return credentials.isValid
        }
        
        return false
    }
    
    func removeAuthentication() async -> Bool {
        let credentials = AuthenticationCredentials()

        credentials.accessToken = nil
        credentials.refreshToken = nil
        
        self.isLoggedIn = credentials.isValid

        return credentials.isValid
    }
}
