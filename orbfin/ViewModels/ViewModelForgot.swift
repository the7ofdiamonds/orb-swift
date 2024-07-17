//
//  ViewModelForgot.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

@MainActor
class ViewModelForgot: ObservableObject {
    @ObservedObject var authentication: Authentication = Authentication()

    @Published var isLoggedIn: Bool? = nil
    @Published var successMessage: String = ""
    @Published var email: String = ""
    @Published var error: Error?
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
    
    let locationManager: LocationManager = LocationManager.instance
    
    func password(username: String, email: String) {
        guard !username.isEmpty || !email.isEmpty else {
            self.errorMessage = "Either an Username or Email is required"
            return
        }
        
        if let _ = locationManager.location {
            let requestForgot: RequestForgot = RequestForgot(username: username, email: email)
            
            Task {
                do {
                    let responseForgot: ResponseForgot = try await Forgot().password(requestForgot: requestForgot)

                    if let email = responseForgot.email {
                        self.email = email
                    }
                    
                    if let successMessage = responseForgot.successMessage {
                        self.successMessage = successMessage
                        self.errorMessage = ""
                    }
                    
                    if let errorMessage = responseForgot.errorMessage {
                        self.errorMessage = errorMessage
                        self.successMessage = ""
                    }
                } catch {
                    self.error = error
                }
            }
        }
    }
}
