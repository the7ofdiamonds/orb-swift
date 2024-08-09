//
//  ComponentSearchBy.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import SwiftUI

struct ComponentSearchBy: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmRealEstate: ViewModelRealEstate
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmResidential: ViewModelResidential

    @StateObject private var location: LocationManager = LocationManager.instance
        
    @State private var streetAddress: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zipcode: String = ""
    @State private var county: String = ""
    
    var request: RequestProperties {
        RequestProperties(
            streetAddress: streetAddress,
            city: city,
            state: state,
            zipcode: zipcode,
            county: county
        )
    }
    
    var body: some View {
        ComponentCardFixed {
            HStack(spacing: 15) {
                VStack {
                    TextField("Street Address", text: $streetAddress)
                    TextField("City", text: $city)
                    TextField("State", text: $state)
                    TextField("Zipcode", text: $zipcode)
                    TextField("County", text: $county)
                }
                
                Button {
                    Task {
                        switch navigation.isPage {
                        case .realestate:
                            await vmRealEstate.getProperties(request: request)
                            
                        case .commercial:
                            await vmCommercial.getProperties(request: request)
                            
                        case .residential:
                            await vmResidential.getProperties(request: request)
                            
                        default:
                            await vmRealEstate.getProperties(request: request)
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: "1.magnifyingglass")
                        Text("Search")
                    }
                }
            }
            
        }
    }
}

#Preview {
    ComponentSearchBy()
}
