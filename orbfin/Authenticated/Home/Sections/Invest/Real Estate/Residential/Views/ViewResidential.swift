//
//  Residential.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewResidential: View {
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelResidential
    @EnvironmentObject var navigation: Navigation

    @StateObject private var location: LocationManager = LocationManager.instance
    
    var properties: [RealEstateProperty]? {
        return vm.properties
    }
    
    @State var show: Bool = true

    var body: some View {
        Group {
            if vmModal.show {
                ComponentCard {
                    ComponentButtonH(label: Page.residential.title, icon: Page.residential.icon) {
                        Task {
                            await vm.getProperties()
                        }
                    }
                    
                    List {
                        if let properties {
                            ForEach(properties) { property in
                                Button(action: {
                                    navigation.change(page: .residentialproperty(property: property))
                                }, label: {
                                    Text(property.address?.toString() ?? "Residential Property")
                                })
                                .font(.headline)
                                .fontWeight(.bold)
                            }
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
                Text("Residential")
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    vmModal.toggle()
                } label: {
                    Image(systemName: "map")
                }

            }
        }
        
    }
}

struct ViewResidential_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewResidential()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(ViewModelResidential())
                .environmentObject(Navigation())
            
            ViewResidential()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(ViewModelResidential())
                .environmentObject(Navigation())
        }
    }
}
