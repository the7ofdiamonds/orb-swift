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
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmResidential: ViewModelResidential

    @StateObject var location: LocationManager = LocationManager.instance
    
    @Namespace private var mapScope

    var body: some View {
          Map(position: $location.position) {
              switch navigation.isPage {
              case .manage:
                  ViewMapTransactions(locations: vmBusiness.locations)
              case .businesstransactions:
                  ViewMapTransactions(locations: vmBusiness.locations)
              case .personaltransactions:
                  ViewMapTransactions(locations: vmPersonal.locations)
              case .blank:
                  ViewMapProperties(properties: $vmRealEstate.properties)
                  
              case .realestate:
                  ViewMapProperties(properties: $vmRealEstate.properties)
                  
              case .commercial:
                  ViewMapProperties(properties: $vmCommercial.properties)
                  
              case .commercialproperty(property: _):
                  ViewMapProperties(properties: $vmCommercial.properties)
                  
              case .residential:
                  ViewMapProperties(properties: $vmResidential.properties)

              case .residentialproperty(property: _):
                  ViewMapProperties(properties: $vmResidential.properties)
                  
              default:
                  UserAnnotation()
              }

        }
        .mapScope(mapScope)
        .mapControls {
            MapUserLocationButton(scope: mapScope)
        }
        .controlSize(.large)
        .onChange(of: navigation.isPage) {
            if navigation.isPage == .services,
               let latitude = location.location?.latitude,
               let longitude = location.location?.longitude {
                withAnimation(.interactiveSpring) {
                    location.changeCamera(coordinates: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image(systemName: navigation.isPage?.icon ?? "questionmark")
                    Text(navigation.isPage?.title ?? "No title")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    vmModal.toggle()
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
}
