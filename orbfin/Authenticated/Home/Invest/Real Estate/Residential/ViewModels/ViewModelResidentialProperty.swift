//
//  ViewModelResidentialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import Foundation

@MainActor
class ViewModelResidentialProperty: ObservableObject {
    @Published var property: RealEstateProperty?
    @Published var successMessage: String? = ""
    @Published var errorMessage: String? = ""
    @Published var cautionMessage: String? = ""
    @Published var showStatus: Bool = false
    @Published var error: NetworkError? = nil
    @Published var showingAlert: Bool = false
    
    init(property: RealEstateProperty? = nil) {
        if property != nil {
            self.property = property
            Task {
                await fetchCoordinatesForProperty()
            }
        } else {
            self.property = PreviewResidentialProperty.loadProperty()
        }
    }
    
    private func fetchCoordinatesForProperty() async {
        if property != nil, let address = property?.address?.toString() {
            property?.coordinates = try? await LocationManager.instance.getCoordinates(address: address)
        }
    }
    
    func request(request: RequestProperty) async throws -> ResponseProvider {
        do {
            let response: ResponseProvider = try await RealEstate().request(request: request)
            
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
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
            throw error
        }
    }
}
