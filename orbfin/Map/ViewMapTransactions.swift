//
//  ViewMapTransactions.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import SwiftUI
import MapKit

struct ViewMapTransactions: MapContent {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmBusiness: ViewModelManageBusinessTransactions
    @EnvironmentObject var vmPersonal: ViewModelManagePersonalTransactions
    
    @StateObject var locationManager: LocationManager = LocationManager.instance
    
    var locations: [MapLocation]
    
    var body: some MapContent {
        ForEach(locations, id: \.id) { location in
            Annotation(location.label, coordinate: location.coordinates) {
                Group {
                    if let logo = location.logo {
                        ComponentImageIcon(url: logo)
                    } else {
                        Image(systemName: "mappin")
                    }
                }
                .frame(width: 70, height: 70)
                .onTapGesture {
                    locationManager.changeCamera(coordinates: location.coordinates)
                    vmModal.show = true
                }
            }
        }
    }
}
