//
//  ViewModelForgot.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

@MainActor
class ViewModelForgot: ObservableObject {
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
    @Published var successfulLogin: Bool = false
    
    var locationManager: LocationManager

    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    
    func login(_ username: String, _ password: String) {
                guard !username.isEmpty else {
                    print("Username is empty")
                    return
                }
        
                guard !password.isEmpty else {
                    print("Password is empty")
                    return
                }
        
        if let location = locationManager.location {
            let requestLogin: RequestLogin = RequestLogin(username: username, password: password, location: location)
            
            Task {
                let login: ResponseLogin = await Login().user(requestLogin: requestLogin)

                if let successMessage = login.successMessage {
                    self.successMessage = successMessage
                    self.successfulLogin = true
                }
                
                if let errorMessage = login.errorMessage {
                    self.errorMessage = errorMessage
                    self.showingAlert = true
                }
            }
        }
    }
}
