//
//  Format.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import Foundation

struct Format {
    static func formatCurrency(_ value: Float, currency: String?) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency ?? "USD"
        return formatter.string(from: NSNumber(value: value)) ?? "$0.00"
    }
}
