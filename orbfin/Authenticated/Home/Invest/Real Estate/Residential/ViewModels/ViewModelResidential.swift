//
//  ViewModelResidential.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import Foundation

@MainActor
class ViewModelResidential: ObservableObject {
    @Published var properties: [RealEstateProperty]?
    @Published var successMessage: String? = nil
    @Published var errorMessage: String? = nil
    @Published var cautionMessage: String? = nil
    @Published var showStatus: Bool = false
    @Published var error: NetworkError? = nil
    @Published var showingAlert: Bool = false
    
    func getProperties(request: RequestProperties?) async -> [RealEstateProperty]? {
        do {
            let response: ResponseProperties = try await Residential().properties(request: request)

            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
                self.showStatus = true
            }

            if let properties = response.properties {
                var updatedProperties = [RealEstateProperty]()
                
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
                
                return updatedProperties
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
        
        return []
    }}
