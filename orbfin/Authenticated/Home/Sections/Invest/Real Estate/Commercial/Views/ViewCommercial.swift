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

//#Preview {
//    ViewCommercial()
//}
