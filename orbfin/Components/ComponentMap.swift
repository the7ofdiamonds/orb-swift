//
//  ComponentMap.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI
import MapKit

struct ComponentMap: View {
    @EnvironmentObject var navigation: Navigation

    @State var region: MKCoordinateRegion
    
    private let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        _region = State(initialValue: LocationManager.instance.region ?? MKCoordinateRegion())
    }
    
    var body: some View {
        Map {
            Annotation("StringProtocol", coordinate: coordinate, anchor: .bottom) {
                Image(systemName: "pin.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        navigation.change(page: .commercialproperty)
                    }
            }
        }
    }
}

struct ComponentMap_Previews: PreviewProvider {
    static var previews: some View {
        ComponentMap(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)) // Example coordinate
            .previewLayout(.sizeThatFits)
    }
}
