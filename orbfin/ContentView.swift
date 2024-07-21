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
    
    var isLoggedIn: Bool {
        authentication.checkAuthentication()
    }
        
    var body: some View {
            #if os(macOS)
            ThreeColumnView()
                .environmentObject(Authentication())
                .environmentObject(Navigation())
            #else
                if isLoggedIn {

                    if UIDevice.current.userInterfaceIdiom == .pad {
                        if Settings().layoutExperience == "Two Column" {
                            TwoColumnView()
                                .environmentObject(Authentication())
                                .environmentObject(Navigation())
                        } else {
                            ThreeColumnView()
                                .environmentObject(Authentication())
                                .environmentObject(Navigation())
                        }
                    } else {
                        OneColumnView()
                            .environmentObject(Authentication())
                            .environmentObject(Navigation())
                    }
                } else {
                    ViewHome {
                        AnyView(ViewLogin())
                    }
                }
            #endif
        }
    }

#Preview {

    ContentView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
