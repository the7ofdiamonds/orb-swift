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
    @EnvironmentObject var vm: ViewModelServices

    @StateObject var location: LocationManager = LocationManager.instance
    
    var body: some MapContent {
        if let services = vm.services {
            ForEach(services, id: \.id) { service in
                if let name = service.name,
                   let mapLocation = service.mapLocation,
                   let coordinates = mapLocation.coordinates {
                    Annotation(name, coordinate: coordinates) {
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
