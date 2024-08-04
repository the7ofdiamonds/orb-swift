//
//  ViewRealEstateCommercialMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/3/24.
//

import SwiftUI

struct ViewRealEstateCommercialMenu: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercial: ViewModelCommercial

    var properties: [Commercial]? {
        if let properties = vmCommercial.properties {
            return properties
        } else {
            return nil
        }
    }
    
    var body: some View {
        Section {
            List {
                ComponentButtonMenu(menu: .commercial)
                    .fontWeight(.bold)
                
                if let properties {
                    ForEach(properties) { property in
                        Button(action: {
                            navigation.browse(page: .commercialproperty(property: property))
                        }, label: {
                            Text(property.address?.toString() ?? "Commercial Property")
                        })
                        .font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    ViewRealEstateCommercialMenu()
}
