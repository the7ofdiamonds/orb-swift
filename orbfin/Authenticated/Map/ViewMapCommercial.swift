//
//  ViewMapCommercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import SwiftUI
import MapKit

struct ViewMapCommercial: MapContent {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    
    @StateObject var location: LocationManager = LocationManager.instance
    
    var body: some MapContent {
        if let commercialProperties = vmCommercial.properties {
            ForEach(commercialProperties) { property in
                if let coordinates = property.coordinates {
                    Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
                        Image(systemName: "mappin")
                            .onTapGesture {
                                navigation.change(page: .commercialproperty(property: property))
                                location.changeCamera(coordinates: coordinates)
                            }
                    }
                }
            }
        }
    }
}
