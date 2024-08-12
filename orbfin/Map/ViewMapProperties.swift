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
    @EnvironmentObject var vmRealEstate: ViewModelRealEstate
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmResidential: ViewModelResidential
    
    @StateObject var location: LocationManager = LocationManager.instance
    
    var properties: [RealEstateProperty]? {
        switch navigation.isPage {
        case .invest, .realestate:
            return vmRealEstate.properties
        case .commercial, .commercialproperty(property: _):
            return vmCommercial.properties
        case .residential, .residentialproperty(property: _):
            return vmResidential.properties
        default:
            return []
        }
    }
    
    var body: some MapContent {
        if let properties {
            ForEach(properties, id: \.id) { property in
                if let coordinates = property.coordinates {
                    Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
                        Image(systemName: "mappin")
                            .onTapGesture {
                                navigation.change(page: .commercialproperty(property: property))
                                vmModal.show = true
                            }
                    }
                }
            }
        }
    }
}
