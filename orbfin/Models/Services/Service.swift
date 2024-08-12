//
//  Service.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import Foundation
import MapKit

struct Service: Identifiable, Codable {
    var id: String
    var created: String
    var updated: String
    var title: String?
    var content: String
    var description: String
    var price: String
    var features: String
    var onboarding_link: String
    var icon: String
    var button_icon: String
    var action_word: String
    var price_id: String
    var url: String
    var address: Address?
    var coordinates: Coordinates?
    var mapLocation: MapLocation?
}
