//
//  ViewModelCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import Foundation
import MapKit

@MainActor
class ViewModelCommercialProperty: ObservableObject {
    @Published var id: String?
    @Published var property: Commercial?
    @Published var successMessage: String? = nil
    @Published var errorMessage: String? = nil
    @Published var cautionMessage: String? = nil
    @Published var error: NetworkError? = nil
    @Published var showingAlert: Bool = false
    
    init(property: Commercial? = nil, id: String? = nil) {
        self.property = property
        self.id = id
    }
    
    func change(property: Commercial) {
        self.property = property
    }
    
    func getProperty(request: RequestRealEstateCommercialProperty) async -> Commercial? {
        do {
            let response: ResponseRealEstateCommercialProperty = try await RealEstate().commercialProperty(request: request)

            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
            }
            if let property = response.property {
                self.property = property

                if let address = property.address {
                    let coordinate = try await LocationManager.instance.getCoordinates(address: address.toString())
                    self.property?.coordinates = coordinate
                }
            }
            
            return self.property
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
        
        return Commercial(id: String())
    }
}
