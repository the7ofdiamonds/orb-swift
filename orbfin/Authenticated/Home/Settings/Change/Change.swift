//
//  Change.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

actor Change {
    
    func username(requestChangeUsername: RequestChangeUsername) async throws -> ResponseChange {
        guard let url = URL(string: BackendURLs.changeUsername) else {
            throw NetworkError.invalidURL
        }
                        
        guard let requestChangeUsernameDict = requestChangeUsername.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestChangeUsernameDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let responseChange = try JSONDecoder().decode(ResponseChange.self, from: serverResponse.data)

            return responseChange
        } catch {
            throw NetworkError.decodingError(error: error)
        }
    }
    
    func password(requestChangePassword: RequestChangePassword) async throws -> ResponseChange {
        guard let url = URL(string: BackendURLs.changePassword) else {
            throw NetworkError.invalidURL
        }
                        
        guard let requestChangePasswordDict = requestChangePassword.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestChangePasswordDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let responseChange = try JSONDecoder().decode(ResponseChange.self, from: serverResponse.data)

            return responseChange
        } catch {
            throw NetworkError.decodingError(error: error)
        }
    }
    
    func name(requestChangeName: RequestChangeName) async throws -> ResponseChange {
        guard let url = URL(string: BackendURLs.changeName) else {
            throw NetworkError.invalidURL
        }
                        
        guard let requestChangeNameDict = requestChangeName.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestChangeNameDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let responseChange = try JSONDecoder().decode(ResponseChange.self, from: serverResponse.data)

            return responseChange
        } catch {
            throw NetworkError.decodingError(error: error)
        }
    }
    
    func phone(requestChangePhone: RequestChangePhone) async throws -> ResponseChange {
        guard let url = URL(string: BackendURLs.changePhone) else {
            throw NetworkError.invalidURL
        }
                        
        guard let requestChangePhoneDict = requestChangePhone.dictionary else {
            throw NetworkError.invalidData
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestChangePhoneDict, options: [])
            let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
            let responseChange = try JSONDecoder().decode(ResponseChange.self, from: serverResponse.data)

            return responseChange
        } catch {
            throw NetworkError.decodingError(error: error)
        }
    }
}
