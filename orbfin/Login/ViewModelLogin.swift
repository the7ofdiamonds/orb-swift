//
//  ViewModelLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI

@MainActor
class ViewModelLogin: ObservableObject {
    @StateObject private var navigation = Navigation()

    @Published var successMessage: String? = nil
    @Published var errorMessage: String? = nil
    @Published var cautionMessage: String? = nil

    @Published var error: NetworkError? = nil
    @Published var showingAlert: Bool = false
    
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
            let requestLogin: RequestLogin = RequestLogin(username: username, password: password, location: Coordinates(latitude: location.latitude, longitude: location.longitude))
            
            do {
                let login: ResponseLogin = try await Login().user(requestLogin: requestLogin)
                
                if let errorMessage = login.errorMessage {
                    self.errorMessage = errorMessage
                }
                
                guard let accessToken = login.accessToken else { return }
                guard let refreshToken = login.refreshToken else { return }
                guard let username = login.username else { return }
                
                if await Authentication().saveAuthentication(accessToken: accessToken, refreshToken: refreshToken, username: username) {
                    if let successMessage = login.successMessage {
                        self.successMessage = successMessage
                    }
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
