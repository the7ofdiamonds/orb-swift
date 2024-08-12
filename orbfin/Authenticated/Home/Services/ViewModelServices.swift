//
//  ViewModelServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import Foundation
import MapKit

@MainActor
class ViewModelServices: ObservableObject {
    @Published var services: [Service]?
    @Published var successMessage: String? = nil
    @Published var errorMessage: String? = nil
    @Published var cautionMessage: String? = nil
    @Published var error: NetworkError? = nil
    @Published var showingAlert: Bool = false
    
    func getServices(request: RequestServices) async -> [Service]? {
        do {
            let response: ResponseServices = try await Services().provided(request: request)

            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
            }

            if let services = response.services {
                var updatedServices = [Service]()
                
                for service in services {
                    var updatedService = service

                    if let coordinates = service.coordinates {
                        updatedService.mapLocation?.coordinates = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
                    } else if let address = service.address?.toString() {
                        let coordinate = try await LocationManager.instance.getCoordinates(address: address)
                        
                        updatedService.mapLocation?.coordinates = coordinate
                        updatedServices.append(updatedService)
                    }
                }
                
                self.services = updatedServices
                
                return updatedServices
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
        
        return []
    }
}

