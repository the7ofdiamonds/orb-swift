//
//  ViewModelResidential.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import Foundation

@MainActor
class ViewModelResidential: ObservableObject {
    @Published var properties: [Residential]?
    @Published var errorMessage: String?
    
    init(properties: [Residential]? = nil) {
        self.properties = properties
    }
    
    func getProperties() async {
        do {
            var properties = PreviewResidential.loadProperties()
            var updatedProperties = [Residential]()
            
            for property in properties {
                if let address = property.address?.toString() {
                    let coordinate = try await LocationManager.instance.getCoordinates(by: address)
                    var updatedProperty = property
                    updatedProperty.coordinates = coordinate
                    updatedProperties.append(updatedProperty)
                } else {
                    updatedProperties.append(property)
                }
            }
            
            self.properties = updatedProperties
        } catch {
            errorMessage = "Failed to fetch coordinates: \(error.localizedDescription)"
        }
    }
}
