//
//  Network.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidData
    case noData(message: String)
    case noResponse(message: String)
    case serverError(error: Error)
    case decodingError(error: Error)
    case unknownError(error: Error)
    
    var title: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidData:
            return "Invalid data"
        case .noData:
            return "No Data"
        case .noResponse:
            return "No Response"
        case .serverError:
            return "Server Error"
        case .decodingError:
            return "Decoding Error"
        case .unknownError:
            return "Unknown Error"
        }
    }
    
    var message: String {
        switch self {
        case .invalidURL:
            return "URL provided is invalid."
        case .invalidData:
            return ""
        case .noData(let message):
            return message
        case .noResponse(let message):
            return message
        case .serverError(let error):
            return "\(error.localizedDescription)"
        case .decodingError(let error):
            return "\(error.localizedDescription)"
        case .unknownError(let error):
            return "\(error.localizedDescription)"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return ""
        case .invalidData:
            return ""
        case .noData(let message):
            return message
        case .noResponse(let message):
            return message
        case .serverError(let error):
            return "\(error.localizedDescription)"
        case .decodingError(let error):
            return "\(error.localizedDescription)"
        case .unknownError(let error):
            return "\(error.localizedDescription)"
        }
    }
}
