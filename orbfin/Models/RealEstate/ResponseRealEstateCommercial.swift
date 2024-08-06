//
//  ResponseRealEstateCommercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import Foundation

struct ResponseRealEstateCommercial: Codable {
    let properties: [Commercial]?
    let errorMessage: String?
    let statusCode: Int
}
