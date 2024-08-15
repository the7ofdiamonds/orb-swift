//
//  ViewModelServiceRequest.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/14/24.
//

import Foundation

@MainActor
class ViewModelServiceRequest: ObservableObject {
    @Published var successMessage: String? = nil
    @Published var errorMessage: String? = nil
    @Published var cautionMessage: String? = nil
    @Published var error: NetworkError? = nil
    @Published var showStatus: Bool = false
    @Published var showingAlert: Bool = false
    
    func requestService(request: RequestService) async throws {
        do {
            let response: ResponseServiceRequest = try await Services().request(request: request)
            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
                self.showStatus = true
            }
            if let successMessage = response.successMessage {
                self.successMessage = successMessage
                self.showStatus = true
            }
        } catch {
            self.error = error as? NetworkError
            print(error)
            self.showingAlert = true
        }
        
    }
}
