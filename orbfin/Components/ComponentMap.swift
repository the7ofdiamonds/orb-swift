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
    @StateObject var locationManager = LocationManager()

    var body: some View {
        ZStack {
            Map(position: $position)
        }
        .onAppear {
            locationManager.checkLocationAuthorization()
        }
    }
}

#Preview {
    ComponentMap()
}
