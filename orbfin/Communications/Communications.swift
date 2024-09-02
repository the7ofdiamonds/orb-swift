//
//  Communications.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/27/24.
//

import Foundation

@MainActor
class Communications: ObservableObject {
    @Published var successMessage: String? = nil
    @Published var errorMessage: String? = nil
    @Published var cautionMessage: String? = nil
    @Published var showStatus: Bool = false
    @Published var error: NetworkError? = nil
    @Published var showingAlert: Bool = false
    
    func request(request: RequestProvider) async throws -> ResponseProvider {
        do {
            if let providerID = request.providerID {
                let providerURL: String = BackendURLs.provider + "/\(providerID)"
                guard let url = URL(string: providerURL) else {
                    throw NetworkError.invalidURL
                }
                guard let requestDict = request.dictionary else {
                    throw NetworkError.invalidData
                }
                let jsonData = try JSONSerialization.data(withJSONObject: requestDict, options: [])
                let serverResponse: ResponseServer = try await NetworkManager.instance.post(url: url, jsonData: jsonData)
                let response: ResponseProvider = try JSONDecoder().decode(ResponseProvider.self, from: serverResponse.data)
                
                showStatus = true
                
                if let errorMessage = response.errorMessage {
                    self.errorMessage = errorMessage
                    print(errorMessage)
                }
                
                if let cautionMessage = response.cautionMessage {
                    self.cautionMessage = cautionMessage
                    print(cautionMessage)
                }
                
                if let successMessage = response.successMessage {
                    self.successMessage = successMessage
                    print(successMessage)
                }
                
                return response
            } else {
                let response = ResponseProvider(errorMessage: "No provider ID provided.", statusCode: 400)
                showStatus = true
print("No provider ID provided.")
                return response
            }
        } catch {
            print(error)
            self.error = error as? NetworkError
            showingAlert = true
            throw error
        }
    }
}
