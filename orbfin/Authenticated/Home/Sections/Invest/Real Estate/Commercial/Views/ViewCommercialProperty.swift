//
//  ViewCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI
import MapKit

struct ViewCommercialProperty: View {
    var property: Commercial
    
    var body: some View {
        ScrollView {

            VStack(spacing: 25) {

                if let images = property.images {
                    ComponentCardImages(images: images)
                }
                
                if let address = property.address {
                    ComponentCardLocation(address: address)
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
}

struct ViewCommercialProperty_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCommercialProperty(property: PreviewCommercialProperty.loadProperty())                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
            
            ViewCommercialProperty(property: PreviewCommercialProperty.loadProperty())                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
        }
    }
}
