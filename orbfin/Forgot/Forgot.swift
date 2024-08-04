//
//  ForgotPassword.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation
import SwiftUI

actor Forgot {
    @StateObject private var locationManager: LocationManager = LocationManager.instance
    
    func password(requestForgot: RequestForgot) async throws -> ResponseForgot {
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
            
            return responseForgot
        } catch {
            throw error
        }
    }
}
