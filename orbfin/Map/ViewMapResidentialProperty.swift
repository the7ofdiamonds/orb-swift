//
//  ViewMapResidentialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import SwiftUI
import MapKit

struct ViewMapResidentialProperty: MapContent {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmResidentialProperty: ViewModelResidentialProperty

    @StateObject var location: LocationManager = LocationManager.instance
    
    @State private var show: Bool

    var body: some MapContent {
        if let residentialProperty = vmResidentialProperty.property,
           let address = residentialProperty.address?.toString(),
           let coordinates = residentialProperty.coordinates {
            Annotation(address, coordinate: coordinates) {
                Image(systemName: "mappin.and.ellipse")
                    .onTapGesture {
                        print(address)
                        navigation.change(page: .residentialproperty(property: residentialProperty))
                        show = true
                    }
            }
        }
    }
}
