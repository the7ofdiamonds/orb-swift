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
            var propertiesURL: String = BackendURLs.realEstate
            
            var queryItems: [URLQueryItem] = []
            
            if let propertyClass = request.propertyClass {
                propertiesURL = "\(propertiesURL)/\(propertyClass.rawValue)"
            }
            
            if let location = request.location,
               let address = location.address {
                if let city = address.city,
                   city != "" {
                    queryItems.append(URLQueryItem(name: "city", value: city))
                }
                if let state = address.state,
                   state != "" {
                    queryItems.append(URLQueryItem(name: "state", value: state))
                }
                if let zipcode = address.zipcode,
                   zipcode != "" {
                    queryItems.append(URLQueryItem(name: "zipcode", value: zipcode))
                }
            }
            
            var urlComponents = URLComponents(string: propertiesURL)!
            
            if queryItems.count > 0 {
                urlComponents.queryItems = queryItems
            }
            
            guard let url = urlComponents.url else {
                throw NetworkError.invalidURL
            }

            guard let requestDict = request.dictionary else {
                throw NetworkError.invalidData
            }
            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseProperties = try JSONDecoder().decode(ResponseProperties.self, from: serverResponse.data)

            return response
        } catch {
            throw error
        }
    }
    
    func propertyByID(_ id: String) async throws -> ResponseRealEstateProperty {
        do {
            let propertyURL = "\(BackendURLs.realEstate)/id/\(id)"
            
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
            let propertyURL = "\(BackendURLs.realEstate)/apn/\(apn)"
            
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
    
    func request(request: RequestProperty) async throws -> ResponseProvider {
        do {
            if let providerID = request.providerID {
                let providerURL: String = BackendURLs.realEstate + "/request/\(providerID)"
                guard let url = URL(string: providerURL) else {
                    throw NetworkError.invalidURL
                }
                guard let requestDict = request.dictionary else {
                    throw NetworkError.invalidData
                }
                let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
                let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
                let response: ResponseProvider = try JSONDecoder().decode(ResponseProvider.self, from: serverResponse.data)
                
                return response
            } else {
                let response = ResponseProvider(errorMessage: "No provider ID provided.", statusCode: 400)

                return response
            }
        } catch {
            throw error
        }
    }
}
