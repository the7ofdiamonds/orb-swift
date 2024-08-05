//
//  ComponentMap.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI
import MapKit

struct ComponentMap: View {
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
                if let commercialProperties = vmCommercial.properties {
                    ForEach(commercialProperties) { property in
                        if let coordinates = property.coordinates {
                            Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
                                Image(systemName: "mappin")
                                    .onTapGesture {
                                        navigation.change(page: .commercialproperty(property: property))
                                        location.changeCamera(coordinates: coordinates)
                                    }
                            }
                        }
                    }
                }

              case .commercialproperty(property: nil):
                if let commercialProperty = vmCommercialProperty.property,
                   let address = commercialProperty.address?.toString(),
                   let coordinates = commercialProperty.coordinates {
                    Annotation(address, coordinate: coordinates) {
                        Image(systemName: "mappin.and.ellipse")
                            .onTapGesture {
                                navigation.change(page: .commercialproperty(property: commercialProperty))
                                location.changeCamera(coordinates: coordinates)
                            }
                    }
                }
                
              case .residential:
                  if let residentialProperties = vmResidential.properties {
                      ForEach(residentialProperties) { property in
                          if let coordinates = property.coordinates {
                              Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
                                  Image(systemName: "mappin")
                                      .onTapGesture {
                                          navigation.change(page: .residentialproperty(property: property))
                                          location.changeCamera(coordinates: coordinates)
                                      }
                              }
                          }
                      }
                  }

              case .residentialproperty(property: nil):
                  if let residentialProperty = vmResidentialProperty.property,
                     let address = residentialProperty.address?.toString(),
                     let coordinates = residentialProperty.coordinates {
                      Annotation(address, coordinate: coordinates) {
                          Image(systemName: "mappin.and.ellipse")
                              .onTapGesture {
                                  navigation.change(page: .residentialproperty(property: residentialProperty))
                                  location.changeCamera(coordinates: coordinates)
                              }
                      }
                  }
                  
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
    ComponentMap()
        .environmentObject(Navigation())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty())
        .environmentObject(ViewModelResidential())
        .environmentObject(ViewModelResidentialProperty())
}
