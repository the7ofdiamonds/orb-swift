//
//  ViewModelRealEstate.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import Foundation
import SwiftUI

@MainActor
class ViewModelRealEstate: ObservableObject {
    @Published var requestID: Int = 0
    @Published var id: String?
    @Published var property: RealEstateProperty?
    @Published var properties: [RealEstateProperty]?
    @Published var successMessage: String? = ""
    @Published var errorMessage: String? = ""
    @Published var cautionMessage: String? = ""
    @Published var showStatus: Bool = false
    @Published var error: NetworkError? = nil
    @Published var showingAlert: Bool = false
    
    func getPropertyByID(_ id: String) async throws {
        do {
            let response: ResponseRealEstateProperty = try await RealEstate().propertyByID(id)
            
            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
                self.showStatus = true
                self.property = nil
                return
            }
            
            if let property = response.property {
                self.property = property

                if let address = property.address {
                    let coordinate = try await LocationManager.instance.getCoordinates(address: address.toString())
                    self.property?.coordinates = coordinate
                }
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
    
    func getPropertyByAPN(_ apn: String) async throws {
        do {
            let response: ResponseRealEstateProperty = try await RealEstate().propertyByAPN(apn)

            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
                self.showStatus = true
                self.property = nil
                return
            }
            
            if let property = response.property {
                self.property = property

                if let address = property.address {
                    let coordinate = try await LocationManager.instance.getCoordinates(address: address.toString())
                    self.property?.coordinates = coordinate
                }
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
    
    func getProperties(request: RequestProperties) async throws {
        do {
            let response: ResponseProperties = try await RealEstate().properties(request: request)

            if let errorMessage = response.errorMessage {
                self.errorMessage = errorMessage
                self.showStatus = true
                self.properties = []
                return
            }

            if let properties = response.properties {
                var updatedProperties = [RealEstateProperty]()

                for property in properties {
                    var updatedProperty = property
                    
                    if let address = property.address?.toString() {
                        let coordinate = try await LocationManager.instance.getCoordinates(address: address)
                        
                        updatedProperty.coordinates = coordinate
                    }
                    
                    updatedProperties.append(updatedProperty)
                }

                self.properties = updatedProperties
                self.requestID += 1
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
}
