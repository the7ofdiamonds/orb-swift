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
    
    @AppStorage("layoutExperience") var selectedLayoutExperience: String?

    var isLoggedIn: Bool {
        authentication.checkAuthentication()
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

    }
}

#Preview {
    ContentView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
