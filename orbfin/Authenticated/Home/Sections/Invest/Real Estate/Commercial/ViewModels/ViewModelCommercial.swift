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
    @Published var properties: [Commercial]? = nil
    @Published var errorMessage: String?
    
    func getProperties() async {
        do {
            var properties = PreviewCommercial.loadProperties()
            var updatedProperties = [Commercial]()
            
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
