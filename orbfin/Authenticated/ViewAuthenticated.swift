//
//  ViewAuthenticated.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/26/24.
//

import SwiftUI
import MapKit

struct ViewAuthenticated: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty
    @EnvironmentObject var vmResidential: ViewModelResidential
    @EnvironmentObject var vmResidentialProperty: ViewModelResidentialProperty
    @EnvironmentObject var vmManagePersonal: ViewModelManagePersonal
    @EnvironmentObject var vmManageBusiness: ViewModelManageBusiness
    
    @ViewBuilder var body: some View {
        ZStack {
            ViewMap()
                .environmentObject(navigation)
                .environmentObject(vmCommercial)
                .environmentObject(vmCommercialProperty)
                .environmentObject(vmResidential)
                .environmentObject(vmResidentialProperty)

            VStack {
                Spacer()
                
                navigation.isView
                    .environmentObject(vmCommercial)
                    .environmentObject(vmCommercialProperty)
                    .environmentObject(vmResidential)
                    .environmentObject(vmResidentialProperty)
                
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
        .environmentObject(ViewModelResidential())
        .environmentObject(ViewModelResidentialProperty(property: PreviewResidential.loadProperties()[0]))
        .environmentObject(ViewModelManagePersonal())
        .environmentObject(ViewModelManageBusiness())
    }
}
