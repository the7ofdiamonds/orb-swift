//
//  ViewMapCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/5/24.
//

import SwiftUI
import MapKit

struct ViewMapCommercialProperty: MapContent {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty
    
    @StateObject var location: LocationManager = LocationManager.instance

    var commercialProperty: RealEstateProperty {
        if let property = vmCommercialProperty.property {
            return property
        } else {
            return RealEstateProperty(id: String())
        }
    }
    
    var address: String {
        if let property = vmCommercialProperty.property,
           let address = property.address {
            print(address.toString())
            return address.toString()
        } else {
            print("Address not provided")
            return "Address not provided"
        }
    }
    
    @State private var show: Bool

    var body: some MapContent {
        if let coordinates = commercialProperty.coordinates {
            Annotation(address, coordinate: coordinates) {
                Image(systemName: "mappin.and.ellipse")
                    .onTapGesture {
                        navigation.change(page: .commercialproperty(property: commercialProperty))
                        show = true
                    }
            }
        }
    }
}
