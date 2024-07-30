//
//  ViewCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI
import MapKit

struct ViewCommercialProperty: View {
    @StateObject var vm = ViewModelCommercialProperty()
    
    var body: some View {
        ZStack {
            ComponentMap(coordinate: vm.coordinates ?? CLLocationCoordinate2D())
            
            ScrollView {
                VStack {
                    if let images = vm.property?.images {
                        ComponentCardImages(images: images)
                    }
                    
                    if let address = vm.property?.address {
                        ComponentCardLocation(address: address)
                    }
                    
                    if let highlights = vm.property?.highlights {
                        ComponentCardHighlights(highlights: highlights)
                    }
                    
                    if let overview = vm.property?.overview {
                        ComponentCardOverview(overview: overview)
                    }
                    
                    if let salesDetails = vm.property?.saleDetails {
                        ComponentCardSaleDetails(saleDetails: salesDetails)
                    }
                    
                    if let buildingDetails = vm.property?.buildingDetails {
                        ComponentCardBuildingDetails(buildingDetails: buildingDetails)
                    }
                    
                    if let landDetails = vm.property?.landDetails {
                        ComponentCardLandDetails(landDetails: landDetails)
                    }
                }
            }
        }
    }
}

#Preview {
    ViewCommercialProperty()
}
