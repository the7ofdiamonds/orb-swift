//
//  Transaction.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/17/24.
//

import Foundation

struct TransactionLocation: Identifiable, Codable {
    var id = UUID()
    var address: String?
    var city: String?
    var region: String?
    var postal_code: String?
    var country: String?
    var lat: Double?
    var lon: Double?
    var store_number: String?
    
    enum CodingKeys: String, CodingKey {
        case address
        case city
        case region
        case postal_code
        case country
        case lat
        case lon
        case store_number
    }
}

struct Transaction: Identifiable, Decodable {
    var id: String
    var type: String
    var amount: Double
    var date: String
    var currencyCode: String
    var description: String
    var name: String
    var logo: String?
    var location: TransactionLocation?
    var mapLocation: MapLocation?
    
    enum CodingKeys: String, CodingKey {
        case id = "transaction_id"
        case type
        case amount
        case date
        case currencyCode = "iso_currency_code"
        case description = "name"
        case name = "merchant_name"
        case logo = "logo_url"
        case location
    }
}
