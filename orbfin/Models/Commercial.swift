//
//  Commercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import Foundation
import MapKit

struct Commercial: Identifiable, Codable {
    var id: String
    var images: [String]?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    var county: String?
    var address: Address? {
        return Address(streetAddress: streetAddress, city: city, state: state, zipcode: zipcode, county: county)
    }
    var coordinates: CLLocationCoordinate2D?
    var price: Int?
    var priceSF: Int?
    var capRate: Double?
    var leased: Double?
    var tenancy: String?
    var saleType: String?
    var saleDetails: SaleDetails? {
        return SaleDetails(price: price, priceSF: priceSF, capRate: capRate, leased: leased, tenancy: tenancy, saleType: saleType)
    }
    var propertyType: String?
    var propertySubType: String?
    var additionalSubTypes: [String]?
    var stories: Int?
    var yearbuilt: Int?
    var sprinklers: String?
    var parkingSpaces: Int?
    var totalBldgSize: Double?
    var buildingDetails: BuildingDetails? {
        return BuildingDetails(propertyType: propertyType, propertySubType: propertySubType, additionalSubTypes: additionalSubTypes, stories: stories, yearbuilt: yearbuilt, sprinklers: sprinklers, parkingSpaces: parkingSpaces, totalBldgSize: totalBldgSize)
    }
    var landAcres: Double?
    var landSqft: Double?
    var zoning: String?
    var apnParcelID: String?
    var landDetails: LandDetails? {
        return LandDetails(landAcres: landAcres, landSqft: landSqft, zoning: zoning, apnParcelID: apnParcelID)
    }
    var highlights: [String]?
    var overview: String?
}
