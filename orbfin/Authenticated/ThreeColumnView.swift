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
            ViewAuthenticated()
                .environmentObject(Navigation())
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        if let page = navigation.isPage {
                            HStack {
                                Spacer()
                                
                                Text(page.title)
                                    .font(Styling.font(component: .title))
                                    .kerning(Styling.kerning)
                                    .padding()
                                
                                Spacer()
                            }
                            .background(Color(Styling.color(.Bar)))
                        }
                    }
                })
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            ComponentBar {
                
                Group {
                    ComponentButtonBar(page: .manage)
                    ComponentButtonBar(page: .invest)
                    ComponentButtonBar(page: .services)
                }
                .padding()
            }
            .ignoresSafeArea(.all)
        }
    }
}


#Preview {
    ThreeColumnView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
