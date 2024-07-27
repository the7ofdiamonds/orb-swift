//
//  ResponseSignup.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

struct ResponseSignup: Codable {
    let successMessage: String?
    let username: String?
    let accessToken: String?
    let refreshToken: String?
    let errorMessage: String?
    let statusCode: Int?
}
