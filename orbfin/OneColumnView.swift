//
//  OneColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct OneColumnView: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        NavigationStack {
            
            ViewHome {
                navigation.isView ?? Page.login.body
            }
            .navigationDestination(for: Page.self) { page in
                page.body
            }
            .toolbar(content: {
                if authentication.checkAuthentication() {
                    ToolbarItemGroup(placement: .bottomBar) {
                        ComponentBar {
                            ComponentButtonBar(page: .manage)
                            ComponentButtonBar(page: .invest)
                            ComponentButtonBar(page: .services)
                        }
                    }
                }
            })
            .toolbar(content: {
                if authentication.checkAuthentication() {
                    ToolbarItemGroup(placement: .navigation) {
                        if let page = navigation.isPage {
                            let parent = page.parent
                            Button(action: {
                                navigation.change(page: parent)
                            }, label: {
                                Text(parent.label)
                                    .font(.subheadline)
                            })
                        }
                    }
                }
            })

        }

    }
}

#Preview {
    OneColumnView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
