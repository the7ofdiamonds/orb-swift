//
//  ResponseTransactions.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/10/24.
//

import Foundation

struct ResponseTransactions: Decodable {
    let accountId: String
    let accountOwner: String?
    let currencyCode: String
    let transactions: [Transaction]
    
    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case accountOwner = "account_owner"
        case currencyCode = "iso_currency_code"
        case transactions
    }
}
