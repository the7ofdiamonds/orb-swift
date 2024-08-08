//
//  Real Estate.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import Foundation
import CoreLocation

actor RealEstate {
    
    func commercialProperties(request: RequestProperties) async throws -> ResponseProperties {
        guard let url = URL(string: BackendURLs.realEstateCommercial) else {
            throw NetworkError.invalidURL
        }
        
        guard let requestDict = request.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseProperties = try JSONDecoder().decode(ResponseProperties.self, from: serverResponse.data)
print(response)
            return response
        } catch {
            print(error)

            throw error
        }
    }
    
    func commercialProperty(request: RequestProperty) async throws -> ResponseProperty {
        
        let propertyURL = "\(BackendURLs.realEstateCommercial)/\(request.id)"
        
        guard let url = URL(string: propertyURL) else {
            throw NetworkError.invalidURL
        }
        
        guard let requestDict = request.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseProperty = try JSONDecoder().decode(ResponseProperty.self, from: serverResponse.data)

            return response
        } catch {
            throw error
        }
    }
    
    func residentialProperties(request: RequestProperties) async throws -> ResponseProperties {
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
    
    func residentialProperty(request: RequestProperty) async throws -> ResponseProperty {
        
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
            let response: ResponseProperty = try JSONDecoder().decode(ResponseProperty.self, from: serverResponse.data)

            return response
        } catch {
            throw error
        }
    }
}
