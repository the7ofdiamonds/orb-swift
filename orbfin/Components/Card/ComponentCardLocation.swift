//
//  ComponentCardLocation.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI

struct ComponentCardLocation: View {
    var address: Address
    
    var body: some View {
        ComponentCard(title: "Location") {
            if let streetAddress = address.streetAddress {
                Text("\(streetAddress)")
            }
            
            HStack {
                if let city = address.city {
                    Text("\(city),")
                }
                if let state = address.state {
                    Text("\(state)")
                }
                if let zipcode = address.zipcode {
                    Text("\(zipcode)")
                }
            }
            
            if let county = address.county {
                Text("\(county)")
            }
        }
    }
}

#Preview {
    ComponentCardLocation(address: PreviewCommercialProperty.loadProperty().address ?? Address())
}
