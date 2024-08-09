//
//  PropertyClass.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import Foundation

enum PropertyClass: String, CaseIterable, Identifiable, Codable {
    case commercial
    case residential
    
    var id: String { rawValue }
}
