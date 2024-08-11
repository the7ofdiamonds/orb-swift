//
//  Transaction.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/17/24.
//

import Foundation

struct TransactionLocation: Identifiable, Codable {
    var id = UUID()
    
    let address: String?
    let city: String?
    let region: String?
    let postal_code: String?
    let country: String?
    let lat: Double?
    let lon: Double?
    let store_number: String?
    
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
    let id: String
    let type: String
    let amount: Double
    let date: String
    let currencyCode: String
    let description: String
    let name: String
    let logo: String?
    let location: TransactionLocation?
    
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
