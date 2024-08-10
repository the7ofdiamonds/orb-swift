//
//  Real Estate.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import Foundation
import CoreLocation

actor RealEstate {
    
    func properties(request: RequestProperties) async throws -> ResponseProperties {
        do {
            guard let url = URL(string: BackendURLs.realEstate) else {
                throw NetworkError.invalidURL
            }
            guard let requestDict = request.dictionary else {
                throw NetworkError.invalidData
            }
            
            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseProperties = try JSONDecoder().decode(ResponseProperties.self, from: serverResponse.data)
            print(response)
            return response
        } catch {
            throw error
        }
    }
    
    func propertyByID(_ id: String) async throws -> ResponseRealEstateProperty {
        do {
            let propertyURL = "\(BackendURLs.realEstate)/\(id)"
            
            guard let url = URL(string: propertyURL) else {
                throw NetworkError.invalidURL
            }
            
            let serverResponse: ResponseServer = try await NetworkManager.instance.get(url: url)
            let response: ResponseRealEstateProperty = try JSONDecoder().decode(ResponseRealEstateProperty.self, from: serverResponse.data)
            
            return response
        } catch {
            throw error
        }
    }
    
    func propertyByAPN(_ apn: String) async throws -> ResponseRealEstateProperty {
        do {
            let propertyURL = "\(BackendURLs.realEstate)"
            
            guard let url = URL(string: propertyURL) else {
                throw NetworkError.invalidURL
            }
            
            let requestBody = ["apn": apn]
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseRealEstateProperty = try JSONDecoder().decode(ResponseRealEstateProperty.self, from: serverResponse.data)
            
            return response
        } catch {
            throw error
        }
    }
}
