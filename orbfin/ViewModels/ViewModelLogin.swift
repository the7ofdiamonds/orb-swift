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
    @Published var isLoggedIn: Bool? = nil
    
    let locationManager: LocationManager = LocationManager.instance
    let authentication: Authentication = Authentication.instance
    
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

                let authenticationSaved: Bool = await authentication.saveAuthentication(responseLogin: login)
                
                if authenticationSaved {
                    if let successMessage = login.successMessage {
                        self.successMessage = successMessage
                        self.isLoggedIn = await authentication.getAuthentication().isValid
                    }
                }
                
                if let errorMessage = login.errorMessage {
                    self.errorMessage = errorMessage
                    self.showingAlert = true
                }
            }
        }
    }
}
