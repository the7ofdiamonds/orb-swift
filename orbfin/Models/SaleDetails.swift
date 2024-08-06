//
//  SaleDetails.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import Foundation

struct SaleDetails: Codable {
    var price: Int?
    var priceSF: Int?
    var capRate: Double?
    var leased: Double?
    var tenancy: String?
    var saleType: String?
}
