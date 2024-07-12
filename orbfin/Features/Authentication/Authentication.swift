//
//  Authentication.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import Foundation

actor Authentication {
    static let instance = Authentication()
    
    let uDStorage = StorageUserDefaults.instance
    
    var isValid: Bool? = nil
    
    func saveAuthentication(responseLogin: ResponseLogin) async -> Bool {
        if let accessToken = responseLogin.accessToken,
           let refreshToken = responseLogin.refreshToken,
           let username = responseLogin.username {
            let accessTokenSaved = await uDStorage.set(key: "access_token", value: accessToken)
            let refreshTokenSaved = await uDStorage.set(key: "refresh_token", value: refreshToken)
            let usernameSaved = await uDStorage.set(key: "username", value: username)
            
            if accessTokenSaved && refreshTokenSaved && usernameSaved {
                return true
            }
        }
        
        return false
    }

    func getAuthentication() async -> AuthenticationCredentials {
        let authentication = AuthenticationCredentials()
        
        let uDStorage = StorageUserDefaults.instance
        
        guard let accessToken = await uDStorage.get("access_token") as? String,
              let refreshToken = await uDStorage.get("refresh_token") as? String,
              let username = await uDStorage.get("username") as? String else {
            return authentication
        }
        
        authentication.accessToken = accessToken
        authentication.refreshToken = refreshToken
        authentication.username = username

        self.isValid = authentication.isValid
        
        return authentication
    }
}
