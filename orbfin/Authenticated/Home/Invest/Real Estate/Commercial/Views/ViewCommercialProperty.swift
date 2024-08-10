//
//  ViewCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI
import MapKit

struct ViewCommercialProperty: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty
    
    @StateObject private var location: LocationManager = LocationManager.instance

    var property: RealEstateProperty?
        
    var images: [String] {
        return property?.images ?? [String()]
    }
    
    var address: Address {
        return Address(streetAddress: property?.streetAddress, city: property?.city, state: property?.state, zipcode: property?.zipcode, county: property?.county)
    }
    
    var body: some View {
            ScrollView {
                if vmModal.show {
                    VStack(spacing: 25) {
                        if let images = property?.images {
                            ComponentCardImages(images: images)
                        }

                        if let address = property?.address {
                            ComponentCardLocation(address: address, action: {
                                vmModal.show = false
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
                    location.changeCamera(coordinates: coordinates)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    if let streetAddress = property?.streetAddress {
                        HStack {
                            Spacer()
                            
                            Text(streetAddress)
                                .font(Styling.font(component: .title))
                                .kerning(Styling.kerning)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color(Styling.color(.Bar)))
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
