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
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty

    @StateObject var location: LocationManager = LocationManager.instance
    @Namespace private var mapScope

    var body: some View {
        Map(position: $location.position) {
            UserAnnotation()
            
            if let properties = vmCommercial.properties {
                ForEach(properties) { property in
                    if let coordinates = property.coordinates {
                        Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
                            Image(systemName: "pin")
                                .onTapGesture {
                                    navigation.change(page: .commercialproperty(property: property))
                                    location.changeCamera(coordinates: coordinates)
                                }
                        }
                    }
                }
            }
            
            if let property = vmCommercialProperty.property,
               let address = property.address?.toString(),
               let coordinates = property.coordinates {
                Annotation(address, coordinate: coordinates) {
                    Image(systemName: "mappin")
                        .onTapGesture {
                            navigation.change(page: .commercialproperty(property: property))
                            location.changeCamera(coordinates: coordinates)
                        }
                }
            }
        }
        .mapScope(mapScope)
        .mapControls {
            MapUserLocationButton(scope: mapScope)
        }
        .controlSize(.large)
        
    }
}

#Preview {
    ComponentMap()
        .environmentObject(Navigation())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty())
}
