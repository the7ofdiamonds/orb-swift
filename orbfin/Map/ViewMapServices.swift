//
//  ViewMapServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import SwiftUI
import MapKit

struct ViewMapServices: MapContent {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmServices: ViewModelServices

    @StateObject var location: LocationManager = LocationManager.instance
    
    var services: [Service]? {
        switch navigation.isPage {
        case .services:
            return vmServices.services
            
        default:
            return nil
        }
    }
    
    var body: some MapContent {
        if let services = services {
            ForEach(services, id: \.id) { service in
                if let title = service.title,
                   let mapLocation = service.mapLocation,
                   let coordinates = mapLocation.coordinates {
                    Annotation(title, coordinate: coordinates) {
                        Image(systemName: "mappin")
                            .onTapGesture {
                                vmModal.showModal = true
                            }
                    }
                }
                
            }
        }
    }
}
