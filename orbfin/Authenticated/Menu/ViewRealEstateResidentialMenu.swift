//
//  ViewRealEstateResidentialMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import SwiftUI

struct ViewRealEstateResidentialMenu: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmResidential: ViewModelResidential

    var properties: [RealEstateProperty]? {
        if let properties = vmResidential.properties {
            return properties
        } else {
            return nil
        }
    }
    
    var body: some View {
        Section {
            List {
                ComponentButtonMenu(menu: .residential)
                    .fontWeight(.bold)
                
                if let properties {
                    ForEach(properties) { property in
                        Button(action: {
                            navigation.browse(page: .residentialproperty(property: property))
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
    ViewRealEstateResidentialMenu()
        .environmentObject(ViewModelResidential())
}
