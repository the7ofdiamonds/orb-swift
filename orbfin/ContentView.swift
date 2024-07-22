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
        if authentication.checkAuthentication() {
            ViewLoggedIn()
                .environmentObject(authentication)
                .environmentObject(navigation)
        } else {
            ViewHome {
                AnyView(ViewLogin())
            }
        }
    }
}

#Preview {
    
    ContentView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
