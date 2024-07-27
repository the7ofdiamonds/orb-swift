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
    
    @ViewBuilder var body: some View {
        NavigationSplitView {
            ComponentButtonHome()
                .environmentObject(navigation)

            ViewHomeMenu()
                .environmentObject(navigation)
        } content: {
            ViewHomeContentMenu()
                .environmentObject(navigation)
        } detail: {
            ViewAuthenticated {
                navigation.isView
            }
        }
    }
}


#Preview {
    ThreeColumnView()
        .environmentObject(Navigation())
}
