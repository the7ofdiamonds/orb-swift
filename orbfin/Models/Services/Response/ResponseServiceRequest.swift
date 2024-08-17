//
//  ResponseServiceRequest.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/14/24.
//

import Foundation

struct ResponseServiceRequest: Codable {
    var successMessage: String?
    var cautionMessage: String?
    var errorMessage: String?
    var statusCode: Int
    
    enum CodingKeys: String, CodingKey {
        case successMessage, cautionMessage, errorMessage, statusCode
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        successMessage = try container.decodeIfPresent(String.self, forKey: .successMessage)
        cautionMessage = try container.decodeIfPresent(String.self, forKey: .cautionMessage)
        errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
        statusCode = try container.decode(Int.self, forKey: .statusCode)
    }
    
    init(successMessage: String? = nil, cautionMessage: String? = nil, errorMessage: String? = nil, statusCode: Int) {
        self.successMessage = successMessage
        self.cautionMessage = cautionMessage
        self.errorMessage = errorMessage
        self.statusCode = statusCode
    }
}
