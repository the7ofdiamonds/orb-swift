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

    @StateObject private var location: LocationManager = LocationManager.instance
    
    var properties: [Commercial]? {
        return vm.properties
    }
    
    var body: some View {
        ComponentCard {
            ComponentButtonH(label: Page.commercial.title, icon: Page.commercial.icon) {
                Task {
                    await vm.getProperties()
                }
            }
        
            List {
                if let properties {
                    ForEach(properties) { property in
                        Button(action: {
                            navigation.browse(page: .commercialproperty(property: property))
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
            .onAppear {
                if let properties, let coordinates = properties[0].coordinates {
                    location.changeCamera(coordinates: coordinates)
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
