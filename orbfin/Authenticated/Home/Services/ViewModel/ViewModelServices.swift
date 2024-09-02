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
    @Published var services: [Service]? = nil
    @Published var service: Service? = nil
    @Published var successMessage: String? = nil
    @Published var errorMessage: String? = nil
    @Published var cautionMessage: String? = nil
    @Published var error: NetworkError? = nil
    @Published var showStatus: Bool = false
    @Published var showingAlert: Bool = false
    
    
    func getServices() async {
        do {
            let response: ResponseServices = try await Services().provided()

            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
                self.showStatus = true
            }

            if let services = response.services {
                self.services = services
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
    
    func getServicesBy(request: RequestServices) async {
        do {
            let response: ResponseServices = try await Services().by(request: request)
            
            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
                self.showStatus = true
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
                    }
                    
                    updatedServices.append(updatedService)
                }
                
                self.services = updatedServices
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
    
    func getServicesByType(_ type: String) async {
        do {
            let response: ResponseServices = try await Services().byType(type)

            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
                self.showStatus = true
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
                    }
                    
                    updatedServices.append(updatedService)
                }
                
                self.services = updatedServices
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
        
    func getServiceByID(_ id: Int) async throws {
        do {
            let response: ResponseService = try await Services().byID(id)

            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
                self.showStatus = true
            }

            if let service = response.service {
                var updatedService = service

                if let coordinates = service.coordinates {
                    updatedService.mapLocation?.coordinates = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
                } else if let address = service.address?.toString() {
                    let coordinate = try await LocationManager.instance.getCoordinates(address: address)
                    
                    updatedService.mapLocation?.coordinates = coordinate
                }
                                    
                self.service = updatedService
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
}

