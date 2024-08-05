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
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty
    @EnvironmentObject var vmResidential: ViewModelResidential
    @EnvironmentObject var vmResidentialProperty: ViewModelResidentialProperty

    @StateObject var location: LocationManager = LocationManager.instance
    
    @Namespace private var mapScope

    var body: some View {
          Map(position: $location.position) {
              switch navigation.isPage {
              case .commercial:
                ViewMapCommercial()
                  
              case .commercialproperty(property: nil):
                  ViewMapCommercialProperty()
                  
              case .residential:
                  ViewMapResidential()

              case .residentialproperty(property: nil):
                  ViewMapResidentialProperty()
                                    
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
    }
}

#Preview {
    ViewMap()
        .environmentObject(Navigation())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty())
        .environmentObject(ViewModelResidential())
        .environmentObject(ViewModelResidentialProperty())
}
