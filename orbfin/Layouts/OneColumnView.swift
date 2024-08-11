//
//  OneColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct OneColumnView: View {
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
        NavigationStack {
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
        .safeAreaInset(edge: .bottom) {
            HStack(alignment: .center, spacing: 50) {
                ComponentButtonBar(page: .manage)
                ComponentButtonBar(page: .invest)
                ComponentButtonBar(page: .services)
            }
            .foregroundColor(Styling.color(.BarFont))
            .frame(maxWidth: 500)
            .padding(.top, 25)
            .padding(.horizontal, 25)
            .background(Styling.color(.Bar))

        }
        
    }
}

struct OneColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Group {    
            OneColumnView()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
        }
        .environmentObject(Authentication())
        .environmentObject(Navigation())
        .environmentObject(ViewModelManagePersonalTransactions())
        .environmentObject(ViewModelManageBusinessTransactions())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty())
        .environmentObject(ViewModelResidential())
        .environmentObject(ViewModelResidentialProperty())
    }
}
