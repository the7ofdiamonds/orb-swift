//
//  ComponentCardResults.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/9/24.
//

import SwiftUI

struct ComponentCardResults: View {
    @EnvironmentObject var navigation: Navigation

    let properties: [RealEstateProperty]
    
    var body: some View {
        List(properties, id: \.id) { property in
                Button(action: {
                    switch property.propertyClass {
                    case "commercial":
                        navigation.change(page: .commercialproperty(property: property))
                    case "residential":
                        navigation.change(page: .residentialproperty(property: property))
                    default:
                        navigation.change(page: .residentialproperty(property: property))
                    }
                }, label: {
                    Text(property.address?.toString() ?? "Commercial Property")
                })
                .font(.headline)
                .fontWeight(.bold)
            }
        }
}


#Preview {
    ComponentCardResults(properties: [RealEstateProperty]())
}
