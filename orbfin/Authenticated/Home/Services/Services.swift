//
//  Services.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/12/24.
//

import Foundation
import CoreLocation

actor Services {
    func provided(request: RequestServices) async throws -> ResponseServices {
        do {
            guard let url = URL(string: BackendURLs.services) else {
                throw NetworkError.invalidURL
            }
            guard let requestDict = request.dictionary else {
                throw NetworkError.invalidData
            }
            
            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
//            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let serverResponse: ResponseServer = try await NetworkManager.instance.get(url: url)
            let response: ResponseServices = try JSONDecoder().decode(ResponseServices.self, from: serverResponse.data)
print(response)
            return response
        } catch {
            throw error
        }
    }
}
