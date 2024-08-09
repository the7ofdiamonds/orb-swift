//
//  ComponentSearchByAPN.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import SwiftUI

struct ComponentSearchByAPN: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelRealEstate
    
    @StateObject private var location: LocationManager = LocationManager.instance
    
    @State private var apn: String = ""
    
    var body: some View {
        ComponentCardFixed {
            HStack(spacing: 15) {
                TextField("APN#", text: $apn)
                Button {
                    Task {
                        guard let property = await vm.getPropertyByAPN(apn) else { return }
                        
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
    ComponentSearchByAPN()
}
