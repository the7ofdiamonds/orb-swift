//
//  RequestProvider.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/27/24.
//

import Foundation

struct RequestProvider: Encodable {
    var providerID: Int64? // Use string
    var serviceID: Int64?
    var propertyID: Int64? // Use string
    var businessID: Int64? // Use string
    var serviceType: String
    var date: String?
    var time: String?
    var address: Address?
    var coordinates: Coordinates?
    
    enum CodingKeys: String, CodingKey {
        case providerID = "provider_id"
        case serviceID = "service_id"
        case propertyID = "property_id"
        case businessID = "business_id"
        case serviceType = "service_type"
        case date
        case time
        case address
        case coordinates
    }
}
