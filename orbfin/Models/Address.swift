//
//  Address.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import Foundation

struct Address: Encodable, Decodable {
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    var country: String?
    
    func toString() -> String {
        return "\(streetAddress ?? ""), \(city ?? ""), \(state ?? "")"
    }
}
