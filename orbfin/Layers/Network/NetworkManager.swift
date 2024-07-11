//
//  NetworkManager.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation

actor NetworkManager {
    static let instance = NetworkManager()
    
    public var headers: [String : String]?
    
    private init() {
        Task {
            let authentication: Authentication = await StorageUserDefaults.instance.getAuthentication()
            await self.useHeaders(authentication: authentication)
        }
    }
    
    private func useHeaders(authentication: Authentication) async {
        if let accessToken: String = authentication.accessToken,
           let refreshToken = authentication.refreshToken {
            self.headers = [
                "Authentication": accessToken,
                "refreshToken": refreshToken
            ]
        }
    }
    
    private func request(request: URLRequest) async throws -> ResponseServer {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if data.isEmpty {
                throw NetworkError.noResponse(message: "No data has been received from this server.")
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                throw NetworkError.noResponse(message: "No response has been received from this server.")
            }
            
            return ResponseServer(data: data, response: urlResponse)
        } catch {
            throw error
        }
    }
    
    func post(url: URL, jsonData: Data?) async throws -> ResponseServer {
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            if let headers = self.headers {
                request.allHTTPHeaderFields = headers
            }
            
            if let jsonData = jsonData {
                request.httpBody = jsonData
            }
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            return try await self.request(request: request)
        } catch {
            throw error
        }
    }
    
    func get(url: URL) async throws -> ResponseServer {
        do {
            var request = URLRequest(url: url)

            if let headers = self.headers {
                request.allHTTPHeaderFields = headers
            }
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            return try await self.request(request: request)
        } catch {
            throw error
        }
    }
}
