//
//  ViewModelLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI

@MainActor
class ViewModelLogin: ObservableObject {
    @ObservedObject var authentication: Authentication = Authentication()

    @Published var isLoggedIn: Bool? = nil
    @Published var successMessage: String = ""
    @Published var error: NetworkError?
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
    
    
    init(){
        self.isLoggedIn = authentication.checkAuthentication()
    }
    
    let locationManager: LocationManager = LocationManager.instance
    let navigation: Navigation = Navigation.instance

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
                        self.isLoggedIn = authentication.checkAuthentication()
                        self.successMessage = successMessage
                        navigation.isView = Page.home.body
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
