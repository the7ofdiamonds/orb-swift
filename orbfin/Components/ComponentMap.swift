//
//  ComponentMap.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI
import MapKit

struct ComponentMap: View {
    @State var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @StateObject var locationManager = LocationManager.instance
    
    let isLoggedIn: Bool = AuthenticationCredentials().isValid
    
    var body: some View {
        if let _ = locationManager.location {
            
            ZStack {
                Map(position: $position)
            }
        }
    }
}

#Preview {
    ComponentMap()
}
