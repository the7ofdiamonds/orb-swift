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
    
    var body: some View {
#if os(macOS)
        ThreeColumnView()
            .environmentObject(authentication)
            .environmentObject(navigation)
#else
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let layoutExperience = Settings().layoutExperience {
                if layoutExperience == "Two Column" {
                    TwoColumnView()
                        .environmentObject(authentication)
                        .environmentObject(navigation)
                } else {
                    ThreeColumnView()
                        .environmentObject(authentication)
                        .environmentObject(navigation)
                }
            } else {
                ThreeColumnView()
                    .environmentObject(authentication)
                    .environmentObject(navigation)
            }
        } else {
            OneColumnView()
                .environmentObject(authentication)
                .environmentObject(navigation)
        }
#endif
    }
}

#Preview {
    ContentView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
