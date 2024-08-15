//
//  ResponseServiceRequest.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/14/24.
//

import Foundation

struct ResponseServiceRequest: Codable {
    var successMessage: String?
    var errorMessage: String?
    var statusCode: Int
    
    enum CodingKeys: String, CodingKey {
        case successMessage, errorMessage, statusCode
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        successMessage = try container.decode(String.self, forKey: .successMessage)
        errorMessage = try container.decode(String.self, forKey: .errorMessage)
        statusCode = try container.decode(Int.self, forKey: .statusCode)
    }
    
    init(successMessage: String? = nil, errorMessage: String? = nil, statusCode: Int) {
        self.successMessage = successMessage
        self.errorMessage = errorMessage
        self.statusCode = statusCode
    }
}
