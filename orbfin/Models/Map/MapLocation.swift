//
//  MapLocations.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import Foundation
import MapKit

struct MapLocation {
    var id = UUID()
    let label: String
    let coordinates: CLLocationCoordinate2D
    let icon: String?
    let logo: String?
}
