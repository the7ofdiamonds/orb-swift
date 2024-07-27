//
//  Signup.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

actor Signup {
    func user(requestSignup: RequestSignup) async throws -> ResponseSignup {
        guard let url = URL(string: BackendURLs.signup) else {
            throw NetworkError.invalidURL
        }
        
        guard let requestSignupDict = requestSignup.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestSignupDict, options: [])
            
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            
            let responseSignup: ResponseSignup = try JSONDecoder().decode(ResponseSignup.self, from: serverResponse.data)
            
            return responseSignup
        } catch {
            throw error
        }
    }
}
