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
        .environmentObject(vmCommercial)
        .environmentObject(vmCommercialProperty)
        .environmentObject(vmResidential)
        .environmentObject(vmResidentialProperty)
        .environmentObject(vmManagePersonal)
        .environmentObject(vmManageBusiness)

    }
}

#Preview {
    ContentView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty())
        .environmentObject(ViewModelResidential())
        .environmentObject(ViewModelResidentialProperty())
        .environmentObject(ViewModelManagePersonal())
        .environmentObject(ViewModelManageBusiness())
}
