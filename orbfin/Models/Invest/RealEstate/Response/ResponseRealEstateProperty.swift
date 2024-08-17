//
//  ResponseRealEstateCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/6/24.
//

import Foundation

struct ResponseRealEstateProperty: Codable {
    let property: RealEstateProperty?
    let errorMessage: String?
    let statusCode: Int?
}
