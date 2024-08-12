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
    @EnvironmentObject var vmServices: ViewModelServices

    @StateObject var location: LocationManager = LocationManager.instance
    
    @Namespace private var mapScope

    var body: some View {
          Map(position: $location.position) {
              switch navigation.isPage {
              case .manage, .personal, .business, .businesstransactions, .personaltransactions:
                  ViewMapTransactions()
              
              case .invest, .realestate,
                      .commercial, .commercialproperty(property: _),
                      .residential, .residentialproperty(property: _):
                  ViewMapProperties()
              
              case .services, .notary:
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
        .environmentObject(ViewModelServices())
}
