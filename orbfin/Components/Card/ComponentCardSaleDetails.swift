//
//  ComponentCardSaleDetails.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI

struct ComponentCardSaleDetails: View {
    var saleDetails: SaleDetails
    
    var body: some View {
        ComponentCard(title: "Sale Details") {
            if let price = saleDetails.price {
                Text("Price \(price)")
            }
            if let priceSF = saleDetails.priceSF {
                Text("Price/SQFT \(priceSF)")
            }
            if let capRate = saleDetails.capRate {
                Text("Cap Rate \(capRate)")
            }
            if let leased = saleDetails.leased {
                Text("% Leased \(leased)")
            }
            if let tenancy = saleDetails.tenancy {
                Text("Tenancy \(tenancy)")
            }
            if let saleType = saleDetails.saleType {
                Text("Sale Type \(saleType)")
            }
        }
    }
}

#Preview {
    ComponentCardSaleDetails(saleDetails:PreviewCommercialProperty.loadProperty().saleDetails ?? SaleDetails())
}
