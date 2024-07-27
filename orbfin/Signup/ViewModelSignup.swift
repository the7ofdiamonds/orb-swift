//
//  ViewModelSignup.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

@MainActor
class ViewModelSignup: ObservableObject {
    @Published var successMessage: String = ""
    @Published var error: NetworkError? = nil
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
    
    let locationManager: LocationManager = LocationManager.instance
    
    func signup(username: String,
                email: String,
                password: String,
                confirmPassword: String,
                nicename: String,
                nickname: String,
                firstname: String,
                lastname: String,
                phone: String) async {
        guard !username.isEmpty else {
            self.errorMessage = "Username is empty"
            return
        }
        
        guard !password.isEmpty else {
            self.errorMessage = "Password is empty"
            return
        }
        
        if let location = locationManager.location {
            let requestSignup = RequestSignup(username: username,
                                              email: email,
                                              password: password,
                                              confirmPassword: confirmPassword,
                                              nicename: nicename,
                                              nickname: nickname,
                                              firstname: firstname,
                                              lastname: lastname,
                                              phone: phone,
                                              location: location)
            
            do {
                let signup: ResponseSignup = try await Signup().user(requestSignup: requestSignup)
                
                guard let accessToken = signup.accessToken else { return }
                guard let refreshToken = signup.refreshToken else { return }
                guard let username = signup.username else { return }
                
                if await Authentication().saveAuthentication(accessToken: accessToken, refreshToken: refreshToken, username: username) {
                    if let successMessage = signup.successMessage {
                        self.successMessage = successMessage
                    }
                }
                
                if let errorMessage = signup.errorMessage {
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
