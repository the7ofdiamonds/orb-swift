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
        return vmServices.services
    }
    
    var body: some MapContent {
        if let services {
            ForEach(services, id: \.id) { service in
                if let coordinates = service.mapLocation?.coordinates {
                    Annotation(service.name, coordinate: coordinates) {
                        Image(systemName: "mappin")
                            .onTapGesture {
                                vmModal.show = true
                            }
                    }
                }
            }
        }
    }
}
