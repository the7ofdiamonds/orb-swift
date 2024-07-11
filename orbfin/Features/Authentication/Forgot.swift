//
//  ForgotPassword.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation

actor Forgot {
    var locationManager: LocationManager = LocationManager.instance
    
    @Published var email: String = ""
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""
    
    func password(requestForgot: RequestForgot) async -> ResponseForgot {
        guard let url = URL(string: BackendURLs.forgotPassword) else {
            return ResponseForgot(errorMessage: "Invalid URL")
        }
        
        guard let requestForgotDict = requestForgot.dictionary else {
            return ResponseForgot(errorMessage: "Invalid Data")
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestForgotDict, options: [])
            
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
                        
            let responseForgot = try JSONDecoder().decode(ResponseForgot.self, from: serverResponse.data)
            
            if let email = responseForgot.email {
                self.email = email
            }
            
            if let successMessage = responseForgot.successMessage {
                self.successMessage = successMessage
            }
            
            if let errorMessage = responseForgot.errorMessage {
                self.errorMessage = errorMessage
            }
            
            return responseForgot
        } catch {
            return ResponseForgot(errorMessage: "\(error.localizedDescription)")
        }
    }
}
