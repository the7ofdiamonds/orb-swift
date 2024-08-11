//
//  TwoColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct TwoColumnView: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmBusiness: ViewModelManageBusinessTransactions
    @EnvironmentObject var vmPersonal: ViewModelManagePersonalTransactions
    @EnvironmentObject var vmRealEstate: ViewModelRealEstate
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty
    @EnvironmentObject var vmResidential: ViewModelResidential
    @EnvironmentObject var vmResidentialProperty: ViewModelResidentialProperty

    var body: some View {
        NavigationSplitView {
            ComponentButtonHome()
                .environmentObject(authentication)
                .environmentObject(navigation)
            
            ViewContentMenu()
                .environmentObject(authentication)
                .environmentObject(navigation)
            
            ViewHomeMenu()
                .environmentObject(authentication)
                .environmentObject(navigation)
        } detail: {
            ViewAuthenticated()
                .environmentObject(authentication)
                .environmentObject(navigation)
                .environmentObject(vmModal)
                .environmentObject(vmPersonal)
                .environmentObject(vmBusiness)
                .environmentObject(vmRealEstate)
                .environmentObject(vmCommercial)
                .environmentObject(vmCommercialProperty)
                .environmentObject(vmResidential)
                .environmentObject(vmResidentialProperty)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            ComponentBarHome()
        }
    }
}

struct TwoColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Group {        
            TwoColumnView()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
        }
        .environmentObject(Authentication())
        .environmentObject(Navigation())
        .environmentObject(ViewModelModal())
        .environmentObject(ViewModelManagePersonalTransactions())
        .environmentObject(ViewModelManageBusinessTransactions())
        .environmentObject(ViewModelRealEstate())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty())
        .environmentObject(ViewModelResidential())
        .environmentObject(ViewModelResidentialProperty())
    }
}
