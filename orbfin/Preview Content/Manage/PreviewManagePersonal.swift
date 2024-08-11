//
//  PreviewManagePersonal.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import Foundation

class PreviewManagePersonal {
    static func loadTransactions() -> ResponseTransactions {
        let json = """
        {
            "account_id": "BxBXxLj1m4HMXBm9WZZmCWVbPjX16EHwv99vp",
            "account_owner": null,
            "iso_currency_code": "JPY",
            "transactions": [
                {
                    "transaction_id": "1",
                    "type": "debit",
                    "amount": 28.34,
                    "iso_currency_code": "USD",
                    "name": "Dd Doordash Burgerkin",
                    "merchant_name": "Burger King",
                    "logo_url": "https://plaid-merchant-logos.plaid.com/burger_king_155.png",
                    "date": "2023-09-28",
                    "location": {
                        "address": null,
                        "city": null,
                        "region": null,
                        "postal_code": null,
                        "country": null,
                        "lat": null,
                        "lon": null,
                        "store_number": null
                    }
                },
                {
                    "transaction_id": "2",
                    "type": "debit",
                    "amount": 72.1,
                    "iso_currency_code": "USD",
                    "name": "PURCHASE WM SUPERCENTER #1700",
                    "merchant_name": "Walmart",
                    "logo_url": "https://plaid-merchant-logos.plaid.com/walmart_1100.png",
                    "date": "2023-09-24",
                    "location": {
                        "address": "13425 Community Rd",
                        "city": "Poway",
                        "region": "CA",
                        "postal_code": "92064",
                        "country": "US",
                        "lat": 32.959068,
                        "lon": -117.037666,
                        "store_number": "1700"
                    }
                }
            ]
        }
        """
        
        if let data = json.data(using: .utf8) {
            do {
                let response = try JSONDecoder().decode(ResponseTransactions.self, from: data)
               return response
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        return ResponseTransactions(accountId: "N/A", accountOwner: nil, currencyCode: "USD", transactions: nil)
    }
}
