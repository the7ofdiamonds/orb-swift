//
//  Commercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI
import MapKit

struct ViewCommercial: View {
    @EnvironmentObject var vm: ViewModelCommercial
    @EnvironmentObject var navigation: Navigation

    @StateObject var location: LocationManager = LocationManager.instance
    
    var properties: [Commercial]?

    init(properties: [Commercial]? = nil) {
        self.properties = properties
    }
    
    
    var body: some View {
        ComponentCard {
            ComponentButtonH(label: Page.commercial(properties: properties).title, icon: Page.commercial(properties: properties).icon) {
                Task {
                    await vm.getProperties()
                }
            }
        
            List {
                if let properties {
                    ForEach(properties) { property in
                        Button(action: {
                            navigation.change(page: .commercialproperty(property: property))
                            if let coordinates = property.coordinates {
                                location.changeCamera(coordinates: coordinates)
                            }
                        }, label: {
                            Text(property.address?.toString() ?? "Commercial Property")
                        })
                        .font(.headline)
                        .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct ViewCommercial_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCommercial()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(ViewModelCommercial())
                .environmentObject(Navigation())
            
            ViewCommercial()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(ViewModelCommercial())
                .environmentObject(Navigation())
        }
    }
}
