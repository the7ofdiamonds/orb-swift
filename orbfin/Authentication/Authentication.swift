//
//  Authentication.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

@MainActor
class Authentication: ObservableObject {
    static var instance = Authentication()
    
    var credentials = AuthenticationCredentials()
    
    @Published var isLoggedIn: Bool = false
    
    init() {
        self.isLoggedIn = credentials.isValid
    }
    
    func checkAuthentication() -> Bool {
        return credentials.isValid
    }
    
    func saveAuthentication(responseLogin: ResponseLogin) async -> Bool {
        if let accessToken = responseLogin.accessToken,
           let refreshToken = responseLogin.refreshToken,
           let username = responseLogin.username {

            credentials.accessToken = accessToken
            credentials.refreshToken = refreshToken
            credentials.username = username
            
            self.isLoggedIn = credentials.isValid

            return self.isLoggedIn
        }
        
        return false
    }
    
    func removeAuthentication() async -> Bool {
        credentials.accessToken = nil
        credentials.refreshToken = nil
         
        self.isLoggedIn = credentials.isValid
        return self.isLoggedIn
    }
}
