//
//  BuildingDetails.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import Foundation

struct BuildingDetails: Codable {
    var propertyType: String?
    var propertySubType: String?
    var additionalSubTypes: [String]?
    var stories: Int?
    var yearbuilt: Int?
    var sprinklers: String?
    var parkingSpaces: Int?
    var totalBldgSize: Double?
}
