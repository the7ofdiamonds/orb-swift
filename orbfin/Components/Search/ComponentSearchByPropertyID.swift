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
    
    var body: some View {
        ComponentCardFixed {
            HStack(spacing: 15) {
                TextField("Property ID#", text: $propertyID)
                Button {
                    Task {
                        guard let property = await vm.getPropertyByID(propertyID) else { return }
                        
                        if let propertyClass = property.propertyClass {
                            switch propertyClass {
                            case "commercial":
                                navigation.change(page: .commercialproperty(property: property))
                            case "residential":
                                navigation.change(page: .residentialproperty(property: property))
                            default:
                                navigation.change(page: .blank)
                            }
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
    ComponentSearchByPropertyID()
}
