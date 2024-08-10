//
//  Residential.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import Foundation
import CoreLocation

actor Residential {
    
    func properties(request: RequestProperties?) async throws -> ResponseProperties {
        guard let url = URL(string: BackendURLs.realEstateResidential) else {
            throw NetworkError.invalidURL
        }
        
        guard let requestDict = request.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseProperties = try JSONDecoder().decode(ResponseProperties.self, from: serverResponse.data)

            return response
        } catch {
            throw error
        }
    }
    
    func property(request: RequestProperty) async throws -> ResponseRealEstateProperty {
        
        let propertyURL = "\(BackendURLs.realEstateResidential)/\(request.id)"
        
        guard let url = URL(string: propertyURL) else {
            throw NetworkError.invalidURL
        }
        
        guard let requestDict = request.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseRealEstateProperty = try JSONDecoder().decode(ResponseRealEstateProperty.self, from: serverResponse.data)

            return response
        } catch {
            throw error
        }
    }
}
