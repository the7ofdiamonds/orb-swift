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
//            VStack {
                if let images = property.images {
                    ComponentCardImages(images: images)
                }
                
                if let address = property.address {
                    ComponentCardLocation(address: address)
                }
                
                if let highlights = property.highlights {
                    ComponentCardHighlights(highlights: highlights)
                }
//                
//                if let overview = property.overview {
//                    ComponentCardOverview(overview: overview)
//                }
//                
//                if let salesDetails = property.saleDetails {
//                    ComponentCardSaleDetails(saleDetails: salesDetails)
//                }
//                
//                if let buildingDetails = property.buildingDetails {
//                    ComponentCardBuildingDetails(buildingDetails: buildingDetails)
//                }
//                
//                if let landDetails = property.landDetails {
//                    ComponentCardLandDetails(landDetails: landDetails)
//                }
//            }
        }
    }
}

#Preview {
    ViewCommercialProperty(property: PreviewCommercialProperty.loadProperty())
}
