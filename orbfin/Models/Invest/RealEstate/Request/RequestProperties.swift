//
//  RequestRealEstateCommercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import Foundation

struct RequestProperties: Encodable {
    var propertyClass: PropertyClass?
    var location: Location?
    var saleDetails: SaleDetails?
    var buildingDetails: BuildingDetails?
    var LandDetails: LandDetails?
}
