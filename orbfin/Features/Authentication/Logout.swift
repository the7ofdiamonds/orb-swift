//
//  Logout.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation

actor Logout {
    var locationManager: LocationManager = LocationManager.instance
    
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""
    
    func user(requestLogout: RequestLogout) async -> ResponseLogout {
        guard let url = URL(string: BackendURLs.logout) else {
            return ResponseLogout(errorMessage: "Invalid URL")
        }
        
        do {
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: nil)
                        
            let responseLogout = try JSONDecoder().decode(ResponseLogout.self, from: serverResponse.data)
            
            if let successMessage = responseLogout.successMessage {
                self.successMessage = successMessage
            }
            
            if let errorMessage = responseLogout.errorMessage {
                self.errorMessage = errorMessage
            }
            
            return responseLogout
        } catch {
            return ResponseLogout(errorMessage: "\(error.localizedDescription)")
        }
    }
}
