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
        
    var body: some View {
        ZStack {
            Map(position: $position)
        }
    }
}

#Preview {
    ComponentMap()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
