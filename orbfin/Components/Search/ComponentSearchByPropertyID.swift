//
//  ComponentSearchByPropertyID.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import SwiftUI

struct ComponentSearchByPropertyID: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelRealEstate
    
    @StateObject private var location: LocationManager = LocationManager.instance
    
    @State private var propertyID: String = ""
    
    var property: RealEstateProperty? {
        return vm.property
    }
    
    var body: some View {
        ComponentCardFixed {
            HStack(spacing: 15) {
                TextField("Property ID#", text: $propertyID)
                Button {
                    Task {
                        try await vm.getPropertyByID(propertyID)
                        
                        if let property = vm.property {
                            if property.propertyClass == "commercial" {
                                navigation.change(page: .commercialproperty(property: property))
                            } else if property.propertyClass == "residential" {
                                navigation.change(page: .residentialproperty(property: property))
                            }
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .fontWeight(.bold)
                .kerning(Styling.kerning)
                .padding()
                .background(Styling.color(.Button))
                .foregroundColor(Styling.color(.ButtonFont))
                .cornerRadius(Styling.cornerRadius)
                .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
                
            }
            .frame(width: 400)

        }
    }
}

#Preview {
    ComponentSearchByPropertyID()
}
