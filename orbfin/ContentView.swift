//
//  ContentView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
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
    @EnvironmentObject var vmManagePersonal: ViewModelManagePersonal
    @EnvironmentObject var vmManageBusiness: ViewModelManageBusiness
    
    @AppStorage("layoutExperience") var selectedLayoutExperience: String?

    var isLoggedIn: Bool {
        authentication.isValid
    }
    
    var body: some View {
        Group {
            if isLoggedIn {
                #if os(macOS)
                    if let selectedLayoutExperience {
                        switch selectedLayoutExperience {
                        case "Two Column":
                            TwoColumnView()
                        case "Three Column":
                            ThreeColumnView()
                        default:
                            TwoColumnView()
                        }
                    } else {
                        TwoColumnView()
                    }
                #else
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        if let selectedLayoutExperience {
                            switch selectedLayoutExperience {
                            case "Two Column":
                                TwoColumnView()
                            case "Three Column":
                                ThreeColumnView()
                            default:
                                TwoColumnView()
                            }
                        } else {
                            TwoColumnView()
                        }
                    } else {
                        OneColumnView()
                    }
                #endif
            } else {
                ViewLogin()
            }
        }
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
        .environmentObject(vmManagePersonal)
        .environmentObject(vmManageBusiness)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
            
            ContentView()
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
        .environmentObject(ViewModelManagePersonal())
        .environmentObject(ViewModelManageBusiness())
    }
}
