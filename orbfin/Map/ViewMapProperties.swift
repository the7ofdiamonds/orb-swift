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
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelRealEstate
    
    @StateObject var location: LocationManager = LocationManager.instance
    
    var body: some MapContent {
        if let properties = vm.properties {
            ForEach(properties, id: \.id) { property in
                if let coordinates = property.coordinates {
                    Annotation(property.address?.toString() ?? "Address Not Available", coordinate: coordinates) {
                        Image(systemName: "mappin")
                            .onTapGesture {
                                if let propertyType = property.propertyType {
                                    if propertyType == "commercial" {
                                        navigation.change(page: .commercialproperty(property: property))
                                    } else if propertyType == "residential" {
                                        navigation.change(page: .residentialproperty(property: property))
                                    }
                                }
                                vmModal.show = true
                            }
                    }
                }
            }
        }
        
        if let property = vm.property,
           let coordinates = property.coordinates {
            Annotation(property.address?.toString() ?? "Address Not Available", coordinate: coordinates) {
                Image(systemName: "mappin")
                    .onTapGesture {
                        if let propertyType = property.propertyType {
                            if propertyType == "commercial" {
                                navigation.change(page: .commercialproperty(property: property))
                            } else if propertyType == "residential" {
                                navigation.change(page: .residentialproperty(property: property))
                            }
                        }
                        vmModal.show = true
                    }
            }
        }
    }
}
