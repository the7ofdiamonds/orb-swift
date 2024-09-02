//
//  ResponseProvider.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/27/24.
//

import Foundation

struct ResponseProvider: Codable {
    var successMessage: String?
    var cautionMessage: String?
    var errorMessage: String?
    var statusCode: Int
}
