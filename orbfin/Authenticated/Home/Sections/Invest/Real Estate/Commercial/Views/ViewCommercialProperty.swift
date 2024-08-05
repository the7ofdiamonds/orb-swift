//
//  ViewCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI
import MapKit

struct ViewCommercialProperty: View {
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty
    @EnvironmentObject var navigation: Navigation
    
    @StateObject private var location: LocationManager = LocationManager.instance

    var property: Commercial?
    
    @State var show: Bool = true
    
    var body: some View {
            ScrollView {
                if show {
                    VStack(spacing: 25) {
                        if let images = property?.images {
                            ComponentCardImages(images: images)
                        }
                        
                        if let address = property?.address {
                            ComponentCardLocation(address: address, action: {
                                show = false
                            })
                        }
                        
                        if let highlights = property?.highlights {
                            ComponentCardHighlights(highlights: highlights)
                        }
                        
                        if let overview = property?.overview {
                            ComponentCardOverview(overview: overview)
                        }
                        
                        if let salesDetails = property?.saleDetails {
                            ComponentCardSaleDetails(saleDetails: salesDetails)
                        }
                        
                        if let buildingDetails = property?.buildingDetails {
                            ComponentCardBuildingDetails(buildingDetails: buildingDetails)
                        }
                        
                        if let landDetails = property?.landDetails {
                            ComponentCardLandDetails(landDetails: landDetails)
                        }
                    }
                }
            }
            .onAppear {
                if let property, let coordinates = property.coordinates {
                    vmCommercialProperty.change(property: property)
                    location.changeCamera(coordinates: coordinates)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    if let address = property?.address?.toString() {
                        HStack {
                            Spacer()
                            
                            Text(address)
                                .font(Styling.font(component: .title))
                                .kerning(Styling.kerning)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color(Styling.color(.Bar)))
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: "map")
                    }

                }
            }
        
    }
}

struct ViewCommercialProperty_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCommercialProperty(property: PreviewCommercialProperty.loadProperty())                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Navigation())
            
            ViewCommercialProperty(property: PreviewCommercialProperty.loadProperty())                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Navigation())
        }
    }
}
