//
//  ViewModelLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI
import MapKit

struct ViewModelLogin {
    var locationManager: LocationManager
    
    func login(_ username: String, _ password: String) {
        guard !username.isEmpty else {
            print("Username is empty")
            return
        }
        
        guard !password.isEmpty else {
            print("Password is empty")
            return
        }
        
        if let location = locationManager.location {
            Login().user(username, password, location)
        }
    }
}
