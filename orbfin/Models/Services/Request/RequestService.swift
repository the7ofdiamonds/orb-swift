//
//  RequestService.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/14/24.
//

import Foundation

struct RequestService: Encodable {
    var id: String
    var date: String
    var time: String
    var address: Address?
    var coordinates: Coordinates?
}
