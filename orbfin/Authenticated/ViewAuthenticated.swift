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
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmBusinessTransactions: ViewModelManageBusinessTransactions
    @EnvironmentObject var vmPersonalTransactions: ViewModelManagePersonalTransactions
    @EnvironmentObject var vmRealEstate: ViewModelRealEstate
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty
    @EnvironmentObject var vmResidential: ViewModelResidential
    @EnvironmentObject var vmResidentialProperty: ViewModelResidentialProperty
    @EnvironmentObject var vmManagePersonal: ViewModelManagePersonal
    @EnvironmentObject var vmManageBusiness: ViewModelManageBusiness
    @EnvironmentObject var vmServices: ViewModelServices
    
    @ViewBuilder var body: some View {
        ZStack {
            ViewMap()
                .environmentObject(vmPersonalTransactions)
                .environmentObject(vmBusinessTransactions)
                .environmentObject(vmRealEstate)
                .environmentObject(vmCommercial)
                .environmentObject(vmCommercialProperty)
                .environmentObject(vmResidential)
                .environmentObject(vmResidentialProperty)
                .environmentObject(vmServices)

            VStack {
                
                navigation.isView
                    .environmentObject(vmModal)
                    .environmentObject(vmPersonalTransactions)
                    .environmentObject(vmBusinessTransactions)
                    .environmentObject(vmRealEstate)
                    .environmentObject(vmCommercial)
                    .environmentObject(vmCommercialProperty)
                    .environmentObject(vmResidential)
                    .environmentObject(vmResidentialProperty)
                    .environmentObject(vmServices)
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
        .environmentObject(ViewModelModal())
        .environmentObject(ViewModelManagePersonalTransactions())
        .environmentObject(ViewModelManageBusinessTransactions())
        .environmentObject(ViewModelRealEstate())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty(property: PreviewCommercial.loadProperties()[0]))
        .environmentObject(ViewModelResidential())
        .environmentObject(ViewModelResidentialProperty(property: PreviewResidential.loadProperties()[0]))
        .environmentObject(ViewModelManagePersonal())
        .environmentObject(ViewModelManageBusiness())
        .environmentObject(ViewModelServices())
    }
}
