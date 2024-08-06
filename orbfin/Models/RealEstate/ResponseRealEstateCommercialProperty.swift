//
//  ResponseRealEstateCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/6/24.
//

import Foundation

struct ResponseRealEstateCommercialProperty: Codable {
    let property: Commercial?
    let errorMessage: String?
    let statusCode: Int
}
