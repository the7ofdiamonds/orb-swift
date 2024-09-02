//
//  Services.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/19/24.
//

import Foundation

enum ServiceType: String, CaseIterable, Identifiable, Equatable {
    case notary
    case appraisal
    case realestateappraisal
    case realestatesales
}

extension ServiceType {
    var id: String {
        switch self {
        case .notary:
            "0"
        case .appraisal:
            "1"
        case .realestateappraisal:
            "1.1"
        case .realestatesales:
            "2"
        }
    }
    
    var title: String {
        switch self {
        case .notary:
            "Notary Public"
        case .appraisal:
            "Appraisal"
        case .realestateappraisal:
            "Real Estate Appraisal"
        case .realestatesales:
            "Real Estate Sales"
        }
    }
    
    var label: String {
        switch self {
        case .notary:
            "Notary Public"
        case .appraisal:
            "Appraisal"
        case .realestateappraisal:
            "Real Estate Appraisal"
        case .realestatesales:
            "Real Estate Sales"
        }
    }
    
    var subType: [ServiceType]? {
        switch self {
        case .notary:
            nil
        case .appraisal:
                [
                    .realestateappraisal
                ]
        case .realestateappraisal:
            nil
        case .realestatesales:
            nil
        }
    }
}
