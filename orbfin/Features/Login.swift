//
//  Login.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import Foundation
import CoreLocation

class Login {
    var locationManager: LocationManager = LocationManager()
    
    func user(_ username: String, _ password: String, _ location: CLLocationCoordinate2D) {
            let latitude = location.latitude
            let longitude = location.longitude
        
            print("\(username) and \(password) and latitude: \(latitude), longitude: \(longitude)")
    }
}

