//
//  ViewHomeContentMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/23/24.
//

import SwiftUI

struct ViewHomeContentMenu: View {
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        if let parent = navigation.isPage?.parent,
           parent.title != Page.manage.title,
           parent.title != Page.invest.title,
           parent.title != Page.services.title {
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
        
        if let menu = navigation.isMenu {
            Button(action: {
                navigation.change(menu: menu)
            }, label: {
                Text(menu.label)
            })
            
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
}

#Preview {
    ViewHomeContentMenu()
        .environmentObject(Navigation())
}
