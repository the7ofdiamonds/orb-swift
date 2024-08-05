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
    @EnvironmentObject var vmProperty: ViewModelCommercialProperty
    @EnvironmentObject var navigation: Navigation

    @StateObject private var location: LocationManager = LocationManager.instance
    
    @State var show: Bool = true
    
    var properties: [Commercial]? {
        return vm.properties
    }
    
    var body: some View {
        Group {
            ComponentCard {
                if show {
                    ComponentButtonH(label: Page.commercial.title, icon: Page.commercial.icon) {
                        Task {
                            await vm.getProperties()
                        }
                    }
                
                    List {
                        if let properties {
                            ForEach(properties) { property in
                                Button(action: {
                                    vmProperty.change(property: property)
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
            .onAppear {
                if let properties, let coordinates = properties[0].coordinates {
                    location.changeCamera(coordinates: coordinates)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Commercial")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: "map")
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
