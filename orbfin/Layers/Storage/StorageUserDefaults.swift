//
//  StorageUserDefaults.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation

actor StorageUserDefaults {
    static let instance = StorageUserDefaults()
    
    func set(key: String, value: Any) -> Bool {
        UserDefaults.standard.setValue(value, forKey: key)
        
        if let valueExist = get(key),
           "\(value)" == "\(valueExist)" {
            return true
        } else {
            return false
        }
    }
    
    func get(_ key: String) -> Any? {
        guard let value = UserDefaults.standard.value(forKey: key) else {
            return nil
        }
        
        return value
    }
    
    func delete(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func saveAuthentication(responseLogin: ResponseLogin) -> Bool {
        if let accessToken = responseLogin.accessToken,
           let refreshToken = responseLogin.refreshToken,
           let username = responseLogin.username {
            let accessTokenSaved = self.set(key: "access_token", value: accessToken)
            let refreshTokenSaved = self.set(key: "refresh_token", value: refreshToken)
            let usernameSaved = self.set(key: "username", value: username)
            
            if accessTokenSaved && refreshTokenSaved && usernameSaved {
                return true
            }
        }
        
        return false
    }

    func getAuthentication() -> Authentication {
        var authentication = Authentication()
        authentication.accessToken = self.get("access_token") as? String
        authentication.refreshToken = self.get("refresh_token") as? String
        authentication.username = self.get("username") as? String

        return authentication
    }
}
