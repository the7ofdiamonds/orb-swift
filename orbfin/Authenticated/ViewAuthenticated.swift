//
//  ViewAuthenticated.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/26/24.
//

import SwiftUI
import MapKit

struct ViewAuthenticated: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty
    
    @ViewBuilder var body: some View {
        ZStack {
            ComponentMap()
                .environmentObject(navigation)
                .environmentObject(vmCommercial)
                .environmentObject(vmCommercialProperty)

            VStack {
                Spacer()
                
                navigation.isView
                
                Spacer()
            }
            .padding(.top, Styling.paddingEdgesTop())
            .padding(.horizontal, Styling.paddingEdgesHorizontal())
            .padding(.bottom, Styling.paddingEdgesBottom())
        }
    }
}

struct ViewAuthenticated_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewAuthenticated()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
            
            ViewAuthenticated()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
        }
        .environmentObject(Navigation())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty(property: PreviewCommercial.loadProperties()[0]))
    }
}
