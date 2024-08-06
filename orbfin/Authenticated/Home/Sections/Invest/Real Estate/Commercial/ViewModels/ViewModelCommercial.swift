//
//  ViewModelCommercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//


import Foundation
import MapKit

@MainActor
class ViewModelCommercial: ObservableObject {
    @Published var properties: [Commercial]?
    @Published var successMessage: String? = nil
    @Published var errorMessage: String? = nil
    @Published var cautionMessage: String? = nil
    @Published var error: NetworkError? = nil
    @Published var showingAlert: Bool = false
    
    init(properties: [Commercial]? = nil) {
        self.properties = properties
    }
    
    func getProperties() async {
            let request = RequestRealEstateCommercial(message: "From application")
            
            do {
                let response: ResponseRealEstateCommercial = try await RealEstate().commercial(request: request)

                if let errorMessage = response.errorMessage {
                    self.errorMessage = errorMessage
                }

                if let properties = response.properties {
                    var updatedProperties = [Commercial]()
                    
                    for property in properties {
                        if let address = property.address?.toString() {
                            let coordinate = try await LocationManager.instance.getCoordinates(address: address)
                            var updatedProperty = property
                            updatedProperty.coordinates = coordinate
                            updatedProperties.append(updatedProperty)
                        } else {
                            updatedProperties.append(property)
                        }
                    }
                    
                    self.properties = updatedProperties
                }

            } catch {
                self.error = error as? NetworkError
                self.showingAlert = true
            }
    }
}
