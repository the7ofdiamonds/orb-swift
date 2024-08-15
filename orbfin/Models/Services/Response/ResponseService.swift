//
//  ResponseService.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/14/24.
//

import Foundation

struct ResponseService: Codable {
    var service: Service?
    var errorMessage: String?
    var statusCode: Int
}
