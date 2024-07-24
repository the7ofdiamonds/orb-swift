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
            ViewHomeMenu()
                .environmentObject(authentication)
                .environmentObject(navigation)
        } content: {
            ViewHomeContentMenu()
                .environmentObject(authentication)
                .environmentObject(navigation)
        } detail: {
            ViewHome {
                navigation.isView ?? Page.login.body
            }
        }
    }
}


#Preview {
    ThreeColumnView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
