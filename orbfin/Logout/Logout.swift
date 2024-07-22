//
//  Logout.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation

actor Logout {
    
    func user(requestLogout: RequestLogout) async throws -> ResponseLogout {
        guard let url = URL(string: BackendURLs.logout) else {
            throw NetworkError.invalidURL
        }
                
        let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: nil)
        
        do {
           let responseLogout = try JSONDecoder().decode(ResponseLogout.self, from: serverResponse.data)

            return responseLogout
        } catch {
            throw NetworkError.decodingError(error: error)
        }
    }
}
