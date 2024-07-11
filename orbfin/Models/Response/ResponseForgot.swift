//
//  ResponseForgot.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation

struct ResponseForgot: Codable {
    var email: String?
    var successMessage: String?
    var errorMessage: String?
}
