//
//  Commercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI
import MapKit

struct ViewCommercial: View {
    @EnvironmentObject var navigation: Navigation

    @StateObject var vm = ViewModelCommercial()
    
    var body: some View {
        Map {
            if let properties = vm.properties {
                ForEach(properties) { property in
                    if let coordinates = property.coordinates {
                        Annotation(property.address?.toString() ?? "", coordinate: coordinates) {
                            Image(systemName: "pin")
                                .onTapGesture {
                                    navigation.change(page: .commercialproperty(property))
                                }
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await vm.getProperties()
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
                .environmentObject(Authentication())
                .environmentObject(Navigation())
            
            ViewCommercial()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
        }
    }
}
