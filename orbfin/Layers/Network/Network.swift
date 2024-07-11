//
//  Network.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData(message: String)
    case noResponse(message: String)
    case serverError(message: String)
    case decodingError(error: Error)
    case unknownError(error: Error)
}
