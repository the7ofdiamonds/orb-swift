//
//  ComponentMap.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI
import MapKit

struct ViewMap: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmPersonal: ViewModelManagePersonalTransactions
    @EnvironmentObject var vmBusiness: ViewModelManageBusinessTransactions
    @EnvironmentObject var vmRealEstate: ViewModelRealEstate
    @EnvironmentObject var vmServices: ViewModelServices
    
    @StateObject var location: LocationManager = LocationManager.instance
    
    @Namespace private var mapScope
    
    var body: some View {
        Map(position: $location.position) {
            switch navigation.isPage {
            case .manage, .personal, .business, .businesstransactions, .personaltransactions:
                ViewMapTransactions()
                
            case .invest, .realestate,
                    .commercial, .commercialproperty,
                    .residential, .residentialproperty:
                ViewMapProperties()
                
            case .services:
                ViewMapServices()
                
            default:
                UserAnnotation()
            }
            
        }
        .mapScope(mapScope)
        .mapControls {
            MapUserLocationButton(scope: mapScope)
        }
        .controlSize(.large)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    vmModal.show.toggle()
                } label: {
                    Image(systemName: "map")
                }
            }
        }
    }
}

#Preview {
    ViewMap()
        .environmentObject(Navigation())
        .environmentObject(ViewModelModal())
        .environmentObject(ViewModelManagePersonal())
        .environmentObject(ViewModelManageBusiness())
        .environmentObject(ViewModelRealEstate())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty())
        .environmentObject(ViewModelResidential())
        .environmentObject(ViewModelResidentialProperty())
        .environmentObject(ViewModelServices())
}
