//
//  ThreeColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct ThreeColumnView: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmBusiness: ViewModelManageBusiness
    @EnvironmentObject var vmPersonal: ViewModelManagePersonal
    @EnvironmentObject var vmBusinessTransactions: ViewModelManageBusinessTransactions
    @EnvironmentObject var vmPersonalTransactions: ViewModelManagePersonalTransactions
    @EnvironmentObject var vmRealEstate: ViewModelRealEstate
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty
    @EnvironmentObject var vmResidential: ViewModelResidential
    @EnvironmentObject var vmResidentialProperty: ViewModelResidentialProperty
    @EnvironmentObject var vmServices: ViewModelServices
    
    @ViewBuilder var body: some View {
        NavigationSplitView {
            ComponentButtonHome()
                .environmentObject(authentication)
                .environmentObject(navigation)

            ViewHomeMenu()
                .environmentObject(authentication)
                .environmentObject(navigation)
        } content: {
            ViewContentMenu()
                .environmentObject(authentication)
                .environmentObject(navigation)
        } detail: {
            ViewAuthenticated()
                .environmentObject(authentication)
                .environmentObject(navigation)
                .environmentObject(vmModal)
                .environmentObject(vmPersonal)
                .environmentObject(vmPersonalTransactions)
                .environmentObject(vmBusiness)
                .environmentObject(vmBusinessTransactions)
                .environmentObject(vmRealEstate)
                .environmentObject(vmCommercial)
                .environmentObject(vmCommercialProperty)
                .environmentObject(vmResidential)
                .environmentObject(vmResidentialProperty)
                .environmentObject(vmServices)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            ComponentBarHome()
        }

    }
}


struct ThreeColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnView()
            .previewDisplayName("iPad Pro")
            .previewDevice(PreviewDevice(rawValue: "iPad Air (10th Generation)"))
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(Authentication())
            .environmentObject(Navigation())
            .environmentObject(ViewModelModal())
            .environmentObject(ViewModelManagePersonal())
            .environmentObject(ViewModelManageBusiness())
            .environmentObject(ViewModelManagePersonalTransactions())
            .environmentObject(ViewModelManageBusinessTransactions())
            .environmentObject(ViewModelRealEstate())
            .environmentObject(ViewModelCommercial())
            .environmentObject(ViewModelCommercialProperty())
            .environmentObject(ViewModelResidential())
            .environmentObject(ViewModelResidentialProperty())
            .environmentObject(ViewModelServices())
    }
}
