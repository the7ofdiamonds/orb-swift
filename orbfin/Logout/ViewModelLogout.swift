//
//  ViewModelLogout.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

@MainActor
class ViewModelLogout: ObservableObject {
    @ObservedObject var authentication: Authentication = Authentication()
    
    @Published var isLoggedIn: Bool? = nil
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""
    @Published var error: NetworkError?
    @Published var showingAlert: Bool = false
        
    init(){
        self.isLoggedIn = authentication.checkAuthentication()
    }
    
    func logout() async throws {
        do {
            let authCreds: AuthenticationCredentials = AuthenticationCredentials()
            
            if authCreds.isValid,
               let accessToken = authCreds.accessToken,
               let refreshToken = authCreds.refreshToken {
                let requestLogout: RequestLogout = RequestLogout(accessToken: accessToken, refreshToken: refreshToken)
                
                authCreds.accessToken = nil
                authCreds.refreshToken = nil
                
                if !authentication.checkAuthentication() {
                    authentication.isLoggedIn = true
                }
                
                let logout: ResponseLogout = try await Logout().user(requestLogout: requestLogout)
                
                if let successMessage = logout.successMessage {
                    self.successMessage = successMessage
                    self.errorMessage = ""
                }
                
                if let errorMessage = logout.errorMessage {
                    self.errorMessage = errorMessage
                }
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
}
