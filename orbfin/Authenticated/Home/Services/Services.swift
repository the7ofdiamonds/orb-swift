//
//  Services.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/12/24.
//

import Foundation
import CoreLocation

actor Services {
    
    func provided() async throws -> ResponseServices {
        do {
            guard let url = URL(string: BackendURLs.services) else {
                throw NetworkError.invalidURL
            }
            
            let serverResponse: ResponseServer = try await NetworkManager.instance.get(url: url)
            let response: ResponseServices = try JSONDecoder().decode(ResponseServices.self, from: serverResponse.data)

            return response
        } catch {
            throw error
        }
    }
    
    func by(request: RequestServices) async throws -> ResponseServices {
        do {
            guard let url = URL(string: BackendURLs.services) else {
                throw NetworkError.invalidURL
            }
            guard let requestDict = request.dictionary else {
                throw NetworkError.invalidData
            }
            
            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseServices = try JSONDecoder().decode(ResponseServices.self, from: serverResponse.data)
            
            return response
        } catch {
            throw error
        }
    }
    
    func byType(_ type: String) async throws -> ResponseServices {
        do {
            let typeURL: String = "\(BackendURLs.services)/type/\(type)"
            guard let url = URL(string: typeURL) else {
                throw NetworkError.invalidURL
            }

            let serverResponse: ResponseServer = try await NetworkManager.instance.get(url: url)
            let response: ResponseServices = try JSONDecoder().decode(ResponseServices.self, from: serverResponse.data)

            return response
        } catch {
            throw error
        }
    }
    
    func byID (_ id: String) async throws -> ResponseService {
        do {
            let idURL: String = "\(BackendURLs.services)/\(id)"
            guard let url = URL(string: idURL) else {
                throw NetworkError.invalidURL
            }

            let serverResponse: ResponseServer = try await NetworkManager.instance.get(url: url)
            let response: ResponseService = try JSONDecoder().decode(ResponseService.self, from: serverResponse.data)
            
            return response
        } catch {
            throw error
        }
    }
    
    func request(request: RequestService) async throws -> ResponseServiceRequest {
        do {
            let requestURL: String = "\(BackendURLs.services)/request/\(request.id)"

            guard let url = URL(string: requestURL) else {
                throw NetworkError.invalidURL
            }
            guard let requestDict = request.dictionary else {
                throw NetworkError.invalidData
            }

            let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let response: ResponseServiceRequest = try JSONDecoder().decode(ResponseServiceRequest.self, from: serverResponse.data)
print(response)
            return response
        } catch {
            print(error)
            throw error
        }
    }
}
