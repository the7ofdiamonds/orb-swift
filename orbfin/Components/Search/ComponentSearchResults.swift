//
//  ComponentCardResults.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/9/24.
//

import SwiftUI

struct ComponentSearchResults: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vm: ViewModelRealEstate

    @State var initialized: Int? = nil
    
    var body: some View {
        if let properties = vm.properties, properties.count > 0,
        initialized != nil {
                
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
                                    vm.property = property
                                    navigation.change(page: .commercialproperty(property: property))
                                    print("commercial")
                                } else if property.propertyClass == "residential" {
                                    vm.property = property
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


struct ComponentSearchResults_Previews: PreviewProvider {
    static var previews: some View {
        ComponentSearchResults(initialized: 1)
            .environmentObject(Navigation())
            .environmentObject(ViewModelRealEstate())
    }
}
