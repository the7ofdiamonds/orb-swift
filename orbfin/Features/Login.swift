//
//  Login.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import Foundation
import CoreLocation

actor Login {
    var locationManager: LocationManager = LocationManager()
    
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""

    func user(requestLogin: RequestLogin) async -> ResponseLogin {
        guard let url = URL(string: "http://localhost:8080") else {
            return ResponseLogin(errorMessage: "Invalid URL")
        }
        
        guard let requestLoginDict = requestLogin.dictionary else {
            return ResponseLogin(errorMessage: "Invalid Data")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestLoginDict, options: [])
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            return ResponseLogin(errorMessage: "Error serializing JSON: \(error)")
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            do {
                let responseLogin = try JSONDecoder().decode(ResponseLogin.self, from: data)
                
                if let successMessage = responseLogin.successMessage {
                    self.successMessage = successMessage
                }
                
                return responseLogin
            } catch {
                return ResponseLogin(errorMessage: "Error serializing JSON: \(error)")
            }
        } catch {
            return ResponseLogin(errorMessage: "Error with request: \(error)")
        }
    }
}


