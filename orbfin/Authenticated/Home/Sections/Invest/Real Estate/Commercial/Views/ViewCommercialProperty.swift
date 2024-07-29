//
//  ViewCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI

struct ViewCommercialProperty: View {
    @StateObject var vm = ViewModelCommercialProperty()
    
    var body: some View {
        ScrollView {
            //        Images
            
            
            //        Address
            if let address = vm.property?.address {
                ComponentCardLocation(address: address)
            }
            
            //        highlights
            if let highlights = vm.property?.highlights {
                ComponentCardHighlights(highlights: highlights)
            }
            
            //        overview
            if let overview = vm.property?.overview {
                ComponentCardOverview(overview: overview)
            }
            
            //        sale details
            if let salesDetails = vm.property?.saleDetails {
                ComponentCardSaleDetails(saleDetails: salesDetails)
            }
            
            //        bulding details
            if let buildingDetails = vm.property?.buildingDetails {
                ComponentCardBuildingDetails(buildingDetails: buildingDetails)
            }
            
//            land details
            if let landDetails = vm.property?.landDetails {
                ComponentCardLandDetails(landDetails: landDetails)
            }
        }
    }
}

#Preview {
    ViewCommercialProperty()
}
