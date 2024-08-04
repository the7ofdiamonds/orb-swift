//
//  Residential.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import Foundation
import MapKit

struct Residential: Identifiable {
    var id: String?
    var images: [String]?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    var county: String?
    var address: Address?
    var coordinates: CLLocationCoordinate2D?
    var price: Int?
    var priceSF: Int?
    var capRate: Double?
    var leased: Double?
    var tenancy: String?
    var saleType: String?
    var saleDetails: SaleDetails?
    var propertyType: String?
    var propertySubType: String?
    var additionalSubTypes: [String]?
    var stories: Int?
    var yearbuilt: Int?
    var sprinklers: String?
    var parkingSpaces: Int?
    var totalBldgSize: Double?
    var buildingDetails: BuildingDetails?
    var landAcres: Double?
    var landSqft: Double?
    var zoning: String?
    var apnParcelID: String?
    var landDetails: LandDetails?
    var highlights: [String]?
    var overview: String?
}
