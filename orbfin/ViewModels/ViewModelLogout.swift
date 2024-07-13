//
//  ViewModelLogout.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

@MainActor
class ViewModelLogout: ObservableObject {
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
    @Published var isLoggedIn: Bool = AuthenticationCredentials().isValid
    
    let locationManager: LocationManager = LocationManager.instance
    let authentication: Authentication = Authentication.instance
    
    func logout() {
        Task {
            let authCreds: AuthenticationCredentials = await authentication.getAuthentication()
            
            if let accessToken = authCreds.accessToken,
               let refreshToken = authCreds.refreshToken {
                let requestLogout: RequestLogout = RequestLogout(accessToken: accessToken, refreshToken: refreshToken)
                let logout: ResponseLogout = await Logout().user(requestLogout: requestLogout)
                
                await StorageUserDefaults.instance.delete("access_token")
                await StorageUserDefaults.instance.delete("refresh_token")
                
                if authCreds.accessToken == nil && authCreds.refreshToken == nil {
                    if let successMessage = logout.successMessage {
                        self.successMessage = successMessage
                    }
                    
                    self.isLoggedIn = await authentication.getAuthentication().isValid
                }
            }
        }
    }
}
