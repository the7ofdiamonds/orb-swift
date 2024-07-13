//
//  Login.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import Foundation
import CoreLocation

actor Login {
    var locationManager: LocationManager = LocationManager.instance
    
    func user(requestLogin: RequestLogin) async throws -> ResponseLogin {
        guard let url = URL(string: BackendURLs.login) else {
            return ResponseLogin(errorMessage: "Invalid URL")
        }
        
        guard let requestLoginDict = requestLogin.dictionary else {
            return ResponseLogin(errorMessage: "Invalid Data")
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestLoginDict, options: [])
            
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            
            let responseLogin: ResponseLogin = try JSONDecoder().decode(ResponseLogin.self, from: serverResponse.data)
            
            return responseLogin
        } catch {
            throw error
        }
    }
}


