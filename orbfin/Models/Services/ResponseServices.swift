//
//  ResponseServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/12/24.
//

import Foundation

struct ResponseServices: Codable {
    var services: [Service]?
    var errorMessage: String?
    var statusCode: Int
}
