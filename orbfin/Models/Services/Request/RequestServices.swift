//
//  RequestServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/12/24.
//

import Foundation

struct RequestServices: Encodable {
    var type: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    var county: String?
    var price: Int?
}
