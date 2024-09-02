//
//  RequestProvider.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/27/24.
//

import Foundation

struct RequestProvider: Codable {
    var providerID: Int // Use string
    var propertyID: Int? // Use string
    var serviceID: Int? // Use string
    var businessID: Int? // Use string
}
