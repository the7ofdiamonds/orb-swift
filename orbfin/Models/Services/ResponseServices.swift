//
//  ResponseServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/12/24.
//

import Foundation

struct ResponseServices: Codable {
    let services: [Service]?
    let errorMessage: String?
    let statusCode: Int
}
