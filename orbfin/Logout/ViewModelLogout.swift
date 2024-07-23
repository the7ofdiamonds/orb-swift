//
//  ViewModelLogout.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

@MainActor
class ViewModelLogout: ObservableObject {
    @ObservedObject var authentication: Authentication
    @ObservedObject var navigation: Navigation

    @Published var isLoggedIn: Bool? = nil
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""
    @Published var error: NetworkError?
    @Published var showingAlert: Bool = false
    
    init(authentication: Authentication, navigation: Navigation){
        self.authentication = authentication
        self.isLoggedIn = authentication.isLoggedIn
        self.navigation = navigation
    }
    
    func logout() async throws {
        do {
            let authCreds = AuthenticationCredentials()
            
            if authCreds.isValid,
               let accessToken = authCreds.accessToken,
               let refreshToken = authCreds.refreshToken {
                let requestLogout: RequestLogout = RequestLogout(accessToken: accessToken, refreshToken: refreshToken)
                
                self.isLoggedIn = await authentication.removeAuthentication()
                
//                let logout: ResponseLogout = try await Logout().user(requestLogout: requestLogout)
                
//                if let successMessage = logout.successMessage {
//                    self.successMessage = successMessage
//                    self.errorMessage = ""
//                }
                
//                if let errorMessage = logout.errorMessage {
//                    self.errorMessage = errorMessage
//                }
                self.errorMessage = "You have been logged out successfully."
            }
            
            if !authCreds.isValid {
                navigation.change(page: .login)
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
}
