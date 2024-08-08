//
//  ViewResidentialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import SwiftUI

struct ViewResidentialProperty: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmResidentialProperty: ViewModelResidentialProperty
    
    @StateObject private var location: LocationManager = LocationManager.instance

    var property: RealEstateProperty
    
    @State private var show: Bool = true

    var body: some View {
        ScrollView {
            if vmModal.show {
                VStack(spacing: 25) {
                    
                    if let images = property.images {
                        ComponentCardImages(images: images)
                    }
                    
                    if let address = property.address {
                        ComponentCardLocation(address: address, action: {
                            vmModal.show = false
                        })
                    }
                    
                    if let highlights = property.highlights {
                        ComponentCardHighlights(highlights: highlights)
                    }
                    
                    if let overview = property.overview {
                        ComponentCardOverview(overview: overview)
                    }
                    
                    if let salesDetails = property.saleDetails {
                        ComponentCardSaleDetails(saleDetails: salesDetails)
                    }
                    
                    if let buildingDetails = property.buildingDetails {
                        ComponentCardBuildingDetails(buildingDetails: buildingDetails)
                    }
                    
                    if let landDetails = property.landDetails {
                        ComponentCardLandDetails(landDetails: landDetails)
                    }
                }
            }
        }
        .onAppear {
            if let coordinates = property.coordinates {
                vmResidentialProperty.property = property
                location.changeCamera(coordinates: coordinates)
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                if let address = property.address?.toString() {
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
                    vmModal.toggle()
                } label: {
                    Image(systemName: "map")
                }

            }
        }
    }
}

#Preview {
    ViewResidentialProperty(property: PreviewResidentialProperty.loadProperty())
        .environmentObject(ViewModelResidentialProperty())
}
