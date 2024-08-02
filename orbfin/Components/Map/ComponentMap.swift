//
//  ComponentMap.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI
import MapKit

struct ComponentMap: View {
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var navigation: Navigation
    
    @State var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    @Namespace private var mapScope
    
//    private var commercialProperties: [Annotation<<#Label: View#>, <#Content: View#>>] {
//        if let properties = vmCommercial.properties {
//            ForEach(properties) { property in
//                if let coordinates = property.coordinates {
//                    Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
//                        Image(systemName: "pin")
//                            .onTapGesture {
//                                navigation.change(page: .commercialproperty(property: property))
//                            }
//                    }
//                }
//            }
//        }
//    }
    
    var body: some View {
        Map(scope: mapScope) {
            UserAnnotation()
            
            if let properties = vmCommercial.properties {
                ForEach(properties) { property in
                    if let coordinates = property.coordinates {
                        Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
                            Image(systemName: "pin")
                                .onTapGesture {
                                    navigation.change(page: .commercialproperty(property: property))
                                }
                        }
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
        .environmentObject(ViewModelCommercial())
        .environmentObject(Navigation())
}
