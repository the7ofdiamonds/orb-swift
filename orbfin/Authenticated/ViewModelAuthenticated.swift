//
//  ViewModelAuthenticated.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/30/24.
//

import Foundation
import MapKit

@MainActor
class ViewModelAuthenticated: ObservableObject {
    var property: Commercial?
    
    @Published var coordinates: CLLocationCoordinate2D?
    @Published var errorMessage: String?
    
    init(property: String? = nil) {
        self.property = PreviewCommercialProperty.loadProperty()
        Task {
            await getCoordinates()
        }
    }
    
    func getCoordinates() async {
        guard let address = self.property?.address?.toString() else {
            errorMessage = "Address is missing"
            return
        }
        
        do {
            self.coordinates = try await LocationManager.instance.getCoordinates(by: address)
        } catch {
            errorMessage = "Failed to fetch coordinates: \(error.localizedDescription)"
        }
    }
}
