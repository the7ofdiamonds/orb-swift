//
//  Login.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import Foundation
import CoreLocation

actor Login {
    
    func user(requestLogin: RequestLogin) async throws -> ResponseLogin {
        guard let url = URL(string: BackendURLs.login) else {
            throw NetworkError.invalidURL
        }
        
        guard let requestLoginDict = requestLogin.dictionary else {
            throw NetworkError.invalidData
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
