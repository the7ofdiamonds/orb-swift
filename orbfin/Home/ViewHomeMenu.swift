//
//  ViewHomeMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/20/24.
//

import SwiftUI

struct ViewHomeMenu: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        if authentication.checkAuthentication() {
            List {
                Button(action: {
                    navigation.change(menu: Menu.manage)
                }, label: {
                    Text(Menu.manage.title)
                })
                .font(.headline)
                .fontWeight(.bold)
                
                ForEach(Menu.manage.submenu) { submenu in
                    Button(action: {
                        navigation.change(menu: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
            
            List{
                Button(action: {
                    navigation.change(menu: Menu.invest)
                }, label: {
                    Text(Menu.invest.title)
                })
                .font(.headline)
                .fontWeight(.bold)
                
                ForEach(Menu.invest.submenu) { submenu in
                    Button(action: {
                        navigation.change(menu: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
            
            List {
                Button(action: {
                    navigation.change(menu: Menu.services)
                }, label: {
                    Text(Menu.services.title)
                })
                .font(.headline)
                .fontWeight(.bold)
                
                ForEach(Menu.services.submenu) { submenu in
                    Button(action: {
                        navigation.change(menu: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
        } else {
            Text("Login to gain access.")
        }
    }
}

#Preview {
    ViewHomeMenu()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
