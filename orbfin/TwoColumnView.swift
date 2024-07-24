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
            ViewHome {
                navigation.isView ?? Page.login.body
            }
        }
        
    }
}

#Preview {
    TwoColumnView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
