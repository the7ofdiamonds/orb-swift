//
//  ResponseRealEstateCommercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import Foundation

struct ResponseProperties: Codable {
    let properties: [RealEstateProperty]?
    let errorMessage: String?
    let statusCode: Int
}
