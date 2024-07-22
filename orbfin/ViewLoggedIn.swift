//
//  ViewLoggedIn.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/20/24.
//

import SwiftUI

struct ViewLoggedIn: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
    #if os(macOS)
        ThreeColumnView()
            .environmentObject(authentication)
            .environmentObject(navigation)
    #else
        if UIDevice.current.userInterfaceIdiom == .pad {
            if Settings().layoutExperience == "Two Column" {
                TwoColumnView()
                    .environmentObject(authentication)
                    .environmentObject(navigation)
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
    ViewLoggedIn()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
