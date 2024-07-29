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
            .toolbar {
                ToolbarItem(placement: .principal) {
                    if let page = navigation.isPage {
                        Text(page.title)
                            .font(Styling.font(component: .title))
                            .kerning(Styling.kerning)
                    }
                }
            }
        }
    }
}


#Preview {
    ThreeColumnView()
        .environmentObject(Navigation())
}
