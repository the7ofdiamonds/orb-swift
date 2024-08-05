//
//  ViewMapResidential.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import SwiftUI
import MapKit

struct ViewMapResidential: MapContent {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmResidential: ViewModelResidential

    @StateObject var location: LocationManager = LocationManager.instance
    
    var body: some MapContent {
        if let residentialProperties = vmResidential.properties {
            ForEach(residentialProperties) { property in
                if let coordinates = property.coordinates {
                    Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
                        Image(systemName: "mappin")
                            .onTapGesture {
                                navigation.change(page: .residentialproperty(property: property))
                                location.changeCamera(coordinates: coordinates)
                            }
                    }
                }
            }
        }
    }
}
