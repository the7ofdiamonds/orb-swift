//
//  ResponseChange.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

struct ResponseChange: Codable {
    let item: String?
    let email: String?
    let successMessage: String?
    let errorMessage: String?
    let statusCode: Int
}
