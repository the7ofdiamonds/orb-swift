//
//  Transaction.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/17/24.
//

import Foundation

struct Transaction: Identifiable, Decodable {
    let id = UUID()
    let accountId: String
    let amount: Double
    let currencyCode: String
    let category: [String]
    let date: String
    let merchantName: String?
    let pending: Bool

    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case amount
        case currencyCode = "iso_currency_code"
        case category
        case date
        case merchantName = "merchant_name"
        case pending
    }
}
