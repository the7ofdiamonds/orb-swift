//
//  ComponentCardLocation.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI

struct ComponentCardLocation: View {
    @EnvironmentObject var navigation: Navigation
    
    var address: Address
    
    var action: () -> Void

    
    var streetAddress: String {
        return address.streetAddress ?? ""
    }
    
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
            
            if let country = address.country {
                Text("\(country)")
            }
            
            Button {
                action()
            } label: {
                HStack {
                    Image(systemName: "map")
                    Text("Show Map")
                        .font(Styling.font(component: .label))
                }
            }

        }
    }
}

#Preview {
    ComponentCardLocation(address: PreviewCommercialProperty.loadProperty().address ?? Address(), action:{
        print("Button Pressed")
    })
}
