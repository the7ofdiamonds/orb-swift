//
//  MapLocations.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import Foundation
import MapKit

struct MapLocation: Codable {
    var id = UUID()
    var label: String?
    var coordinates: CLLocationCoordinate2D?
    var icon: String?
    var logo: String?
}
