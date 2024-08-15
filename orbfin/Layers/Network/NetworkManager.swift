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
    
    private func useHeaders() async {
        if let accessToken: String = await Authentication().accessToken,
           let refreshToken: String = await Authentication().refreshToken {
            self.headers = [
                "Authorization": "Bearer \(accessToken)",
                "refreshToken": refreshToken
            ]
        }
    }
    
    private func request(request: URLRequest) async throws -> ResponseServer {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if data.isEmpty {
                throw NetworkError.noData(message: "No data has been received from this server.")
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                throw NetworkError.noResponse(message: "No response has been received from this server.")
            }

            switch urlResponse.statusCode {
                case 200...299:
                    return ResponseServer(data: data, response: urlResponse)
                case 300...399:
                    let serverMessage = String(data: data, encoding: .utf8) ?? "Unknown redirection error"
                    throw NetworkError.clientError(statusCode: urlResponse.statusCode, message: "Redirection error: \(serverMessage)")
                case 400...499:
                    let serverMessage = String(data: data, encoding: .utf8) ?? "Unknown client error"
                    throw NetworkError.clientError(statusCode: urlResponse.statusCode, message: "Client error: \(serverMessage)")
                case 500...599:
                    let serverMessage = String(data: data, encoding: .utf8) ?? "Unknown server error"
                    throw NetworkError.serverError(error: NSError(domain: "", code: urlResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: serverMessage]))
                default:
                    let serverMessage = String(data: data, encoding: .utf8) ?? "Unknown error"
                    throw NetworkError.unknownError(error: NSError(domain: "", code: urlResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: serverMessage]))
                }
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
            throw NetworkError.serverError(error: error)
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
