//
//  ViewModelLogout.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

@MainActor
class ViewModelLogout: ObservableObject {
    let authentication = Authentication()
    
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""
    @Published var error: NetworkError?
    @Published var showingAlert: Bool = false
    
    func logout() async throws {
        do {
            let isValid = await authentication.removeAuthentication()
            
            if !isValid {
                guard let accessToken = authentication.accessToken else { return }
                guard let refreshToken = authentication.refreshToken else { return }
                
                let requestLogout: RequestLogout = RequestLogout(accessToken: accessToken, refreshToken: refreshToken)
                   
                let logout: ResponseLogout = try await Logout().user(requestLogout: requestLogout)
                
                if let successMessage = logout.successMessage {
                    self.successMessage = successMessage
                    self.errorMessage = ""
                }
                
                if let errorMessage = logout.errorMessage {
                    self.errorMessage = errorMessage
                }
                
                self.errorMessage = "You have been logged out successfully."
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
}
