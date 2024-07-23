//
//  ThreeColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct ThreeColumnView: View {
    @EnvironmentObject var navigation: Navigation
    
    @State private var selectedMenu: ViewType? = nil
    @State private var selectedContentMenu: ViewType? = nil
    @State private var selectedDetailView: Page? = nil
    
    @ViewBuilder var body: some View {
        NavigationSplitView {
//            List {
//                ForEach(Menu.home.submenu, id: \.label) { menu in
//                    Button(action: {
//                        selectedMenu = menu
//                    }, label: {
//                        Text(menu.label)
//                    })
//                }
//            }
        } content: {
//            List {
//                if let selectedMenu {
//                    ForEach(selectedMenu.submenu, id: \.label) { submenu in
//                        Button(action: {
//                            selectedContentMenu = submenu
//                            navigation.change(view: submenu)
//                        }, label: {
//                            Text(submenu.label)
//                        })
//                    }
//                } else {
//                    ForEach(Menu.manage.submenu, id: \.label) { submenu in
//                        Button(action: {
//                            selectedContentMenu = submenu
//                            navigation.change(view: submenu)
//                        }, label: {
//                            Text(submenu.label)
//                        })
//                    }
//                }
//            }
        } detail: {
            ViewHome {
                AnyView(navigation.isView)
            }
        }
    }
}


#Preview {
    ThreeColumnView()
        .environmentObject(Navigation())
}
