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

    @StateObject var vm = ViewModelCommercial()
    
    var body: some View {
        Map {
            UserAnnotation(anchor: .bottom)

            if let properties = vm.properties {
                ForEach(properties) { property in
                    if let coordinates = property.coordinates {
                        Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
                            Image(systemName: "pin")
                                .onTapGesture {
                                    navigation.change(page: .commercialproperty(property))
                                }
                        }
                    }
                }
            }
        }
    }
}
