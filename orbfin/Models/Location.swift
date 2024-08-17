//
//  Location.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/17/24.
//

import Foundation

struct Location: Decodable, Encodable {
    var id: String?
    var address: Address?
    var coordinates: Coordinates?
}
