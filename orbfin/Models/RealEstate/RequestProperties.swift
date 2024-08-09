//
//  RequestRealEstateCommercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import Foundation

struct RequestProperties: Encodable {
    var propertyClass: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    var county: String?
    var price: Int?
    var priceSF: Int?
    var capRate: Double?
    var leased: Double?
    var tenancy: String?
    var saleType: String?
    var propertyType: String?
    var propertySubType: String?
    var stories: Int?
    var yearbuilt: Int?
    var sprinklers: String?
    var parkingSpaces: Int?
    var totalBldgSize: Double?
    var landAcres: Double?
    var landSqft: Double?
    var zoning: String?
}
