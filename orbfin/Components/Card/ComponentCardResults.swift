//
//  ComponentCardResults.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/9/24.
//

import SwiftUI

struct ComponentCardResults: View {
    @EnvironmentObject var navigation: Navigation
    
    @State var properties: [RealEstateProperty]?
    
    var body: some View {
        if let properties = properties, properties.count > 0 {
            
            ComponentCardFixed {
                Text("Property Search Results")
                    .font(.title)
                    .kerning(Styling.kerning)
                    .foregroundStyle(Styling.color(.CardFont))
                    .fontWeight(.bold)
                
                ComponentDivider()
                
                VStack(alignment: .center, spacing: 20) {
                    ForEach(properties) { property in
                        Button(action: {
                            if property.propertyClass == "commercial" {
                                navigation.change(page: .commercialproperty(property: property))
                            } else if property.propertyClass == "residential" {
                                navigation.change(page: .residentialproperty(property: property))
                            }
                        }, label: {
                            if let address = property.address {
                                Text(address.toString())
                            } else {
                                Text("Commercial Property #\(property.id)")
                            }
                        })
                        .fontWeight(.bold)
                        .kerning(Styling.kerning)
                        .padding()
                        .background(Styling.color(.Button))
                        .foregroundColor(Styling.color(.ButtonFont))
                        .cornerRadius(Styling.cornerRadius)
                        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)

                    }
                    
                    Spacer()
                }
                .frame(width: 500)
                .frame(minHeight: 250)

            }
            .padding(0)
        }
    }
}


struct ComponentCardResults_Previews: PreviewProvider {
    static var previews: some View {
        ComponentCardResults(properties: PreviewResidential.loadProperties())
            .environmentObject(Navigation())
    }
}
