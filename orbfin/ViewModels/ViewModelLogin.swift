//
//  ViewModelLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI

@MainActor
class ViewModelLogin: ObservableObject {
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
    @Published var successfulLogin: Bool = false
    
    var authenticationSaved: Bool = false
    
    var locationManager: LocationManager

    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    
    func login(_ username: String, _ password: String) {
        guard !username.isEmpty else {
            self.errorMessage = "Username is empty"
            return
        }

        guard !password.isEmpty else {
            self.errorMessage = "Password is empty"
            return
        }
        
        if let location = locationManager.location {
            let requestLogin: RequestLogin = RequestLogin(username: username, password: password, location: location)
            
            Task {
                let login: ResponseLogin = await Login().user(requestLogin: requestLogin)

                self.loginSave(responseLogin: login)
                
                if authenticationSaved {
                    if let successMessage = login.successMessage {
                        self.successMessage = successMessage
                        self.successfulLogin = true
                    }
                }
                
                if let errorMessage = login.errorMessage {
                    self.errorMessage = errorMessage
                    self.showingAlert = true
                }
            }
        }
    }
    
    func loginSave(responseLogin: ResponseLogin) {
        Task {
            self.authenticationSaved = await StorageUserDefaults.instance.saveAuthentication(responseLogin: responseLogin)
        }
    }
    
    func loginCheck() {
        Task {
            let authentication: Authentication = await StorageUserDefaults.instance.getAuthentication()
            
            if let _ = authentication.accessToken,
               let _ = authentication.refreshToken,
               let _ = authentication.username {
                self.successfulLogin = true
            }
        }
    }
}
