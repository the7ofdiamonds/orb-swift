//
//  RequestRealEstateCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/6/24.
//

import Foundation

struct RequestProperty: Encodable {
    let id: Int64
    let apn: String?
    let propertyClass: String?
    let location: Location?
    let saleDetails: SaleDetails?
    let buildingDetails: BuildingDetails?
    let landDetails: LandDetails?
    let providerID: Int64?
    let date: String?
    let time: String?
}
