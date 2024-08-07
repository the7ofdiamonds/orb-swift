//
//  ViewMapCommercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import SwiftUI
import MapKit

struct ViewMapProperties: MapContent {
    @EnvironmentObject var navigation: Navigation
    
    @StateObject var location: LocationManager = LocationManager.instance
    
    @Binding var properties: [RealEstateProperty]?
    
    var body: some MapContent {
        if let properties {
            ForEach(properties, id: \.id) { property in
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
