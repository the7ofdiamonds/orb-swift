//
//  Address.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import Foundation

struct Address: Codable {
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    var county: String?
    
    func toString() -> String {
        return "\(streetAddress ?? ""), \(city ?? ""), \(state ?? "")"
    }
}
