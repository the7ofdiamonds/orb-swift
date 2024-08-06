//
//  Real Estate.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import Foundation
import CoreLocation

actor RealEstate {
    
    func commercial(request: RequestRealEstateCommercial) async throws -> ResponseRealEstateCommercial {
        guard let url = URL(string: BackendURLs.realEstateCommercial) else {
            throw NetworkError.invalidURL
        }
        
        guard let requestDict = request.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseRealEstateCommercial = try JSONDecoder().decode(ResponseRealEstateCommercial.self, from: serverResponse.data)

            return response
        } catch {
            throw error
        }
    }
}
