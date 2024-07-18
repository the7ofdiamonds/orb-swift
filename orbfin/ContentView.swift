//
//  ContentView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authentication: Authentication
    
    @StateObject private var navigation = Navigation.instance
    
    @State private var isLoggedIn: Bool?
    @State private var selectedMenu: ViewType? = nil
    @State private var selectedContentMenu: ViewType? = nil
    @State private var selectedDetailView: Page? = nil
    
    @ViewBuilder var body: some View {
        NavigationSplitView {
            List {
                ForEach(Menu.home.submenu, id: \.label) { menu in
                    Button(action: {
                        selectedMenu = menu
                    }, label: {
                        Text(menu.label)
                    })
                }
            }
        } content: {
            if let selectedMenu {
                List {
                    ForEach(selectedMenu.submenu, id: \.label) { submenu in
                        Button(action: {
                            selectedContentMenu = submenu
                            navigation.change(view: submenu)
                        }, label: {
                            Text(submenu.label)
                        })
                    }
                }
            }
        } detail: {
            if let _ = selectedContentMenu {
                ViewHome {
                    AnyView(navigation.isView)
                }
            } else {
                ViewHome {
                    AnyView(ComponentCard {
                        Text("Make a selection")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
