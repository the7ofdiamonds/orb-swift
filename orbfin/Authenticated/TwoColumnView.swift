//
//  TwoColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct TwoColumnView: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        NavigationSplitView {
            ComponentButtonHome()
                .environmentObject(navigation)
            
            ViewHomeContentMenu()
                .environmentObject(authentication)
                .environmentObject(navigation)
            
            Section {
                List {
                    ForEach(Menu.home.submenu, id: \.id) { menu in
                        Button(action: {
                            navigation.change(menu: menu)
                        }, label: {
                            Text(menu.label)
                        })
                        .font(.headline)
                        .fontWeight(.bold)
                    }
                }
            }
        } detail: {
            ViewAuthenticated()
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
            VStack {
                Spacer()

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
}

#Preview {
    TwoColumnView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
