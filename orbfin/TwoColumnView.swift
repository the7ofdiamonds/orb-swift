//
//  TwoColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct TwoColumnView: View {
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        NavigationSplitView {
            
            if let parent = navigation.isPage?.parent,
               parent != .manage, parent != .invest, parent != .services {
               
                Button(action: {
                    navigation.change(page: parent)
                }, label: {
                    Text(parent.label)
                })
                
                if let menu = Menu(title: parent.title) {
                    List {
                        ForEach(menu.submenu) { child in
                            Button(action: {
                                navigation.change(menu: child)
                            }, label: {
                                Text(child.label)
                            })
                        }
                    }
                }
            }
            
            Text("Manage")
            List {
                ForEach(Menu.manage.submenu) { submenu in
                    Button(action: {
                        navigation.change(menu: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
            
            Text("Invest")
            List{
                ForEach(Menu.invest.submenu) { submenu in
                    Button(action: {
                        navigation.change(menu: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
            
            Text("Services")
            List {
                ForEach(Menu.services.submenu) { submenu in
                    Button(action: {
                        navigation.change(menu: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
        } detail: {
            ViewHome {
                navigation.isView
            }
        }
        
    }
}

#Preview {
    TwoColumnView()
        .environmentObject(Navigation())
}
