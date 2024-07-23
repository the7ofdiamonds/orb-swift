//
//  ViewModelLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI

@MainActor
class ViewModelLogin: ObservableObject {
    @ObservedObject var authentication: Authentication
    @ObservedObject var navigation: Navigation
    
    @Published var isLoggedIn: Bool?
    @Published var successMessage: String = ""
    @Published var error: NetworkError?
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
    
    init(authentication: Authentication, navigation: Navigation) {
        self.authentication = authentication
        self.isLoggedIn = authentication.isLoggedIn
        self.navigation = navigation
    }
    
    let locationManager: LocationManager = LocationManager.instance

    func login(_ username: String, _ password: String) async {
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
            
            do {
                let login: ResponseLogin = try await Login().user(requestLogin: requestLogin)
                
                if await authentication.saveAuthentication(responseLogin: login) {
                    if let successMessage = login.successMessage {
                        self.successMessage = successMessage
                        navigation.change(page: Page.home)
                    }
                }
                
                if let errorMessage = login.errorMessage {
                    self.errorMessage = errorMessage
                    self.showingAlert = true
                }
            } catch {
                self.error = error as? NetworkError
                self.showingAlert = true
            }
        } else {
            locationManager.checkLocationAuthorization()
        }
    }
}
