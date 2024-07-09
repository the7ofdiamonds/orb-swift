//
//  Location.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import Foundation


struct UserLocation: Identifiable {
    var id: String = UUID().uuidString
    var latitude: Double
    var longitude: Double
}
