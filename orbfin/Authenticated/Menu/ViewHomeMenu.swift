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

    var isLoggedIn: Bool {
        authentication.isValid
    }
    
    var body: some View {
        if isLoggedIn {
            List {
                Button(action: {
                    navigation.change(page: Page.manage)
                }, label: {
                    Text(Page.manage.label)
                })
                .font(.headline)
                .fontWeight(.bold)
                
                ForEach(Page.manage.submenu) { submenu in
                    Button(action: {
                        navigation.change(page: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
            
            List{
                Button(action: {
                    navigation.change(page: Page.invest)
                }, label: {
                    Text(Page.invest.label)
                })
                .font(.headline)
                .fontWeight(.bold)
                
                ForEach(Page.invest.submenu) { submenu in
                    Button(action: {
                        navigation.change(page: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
            
            List {
                Button(action: {
                    navigation.change(page: Page.services)
                }, label: {
                    Text(Page.services.label)
                })
                .font(.headline)
                .fontWeight(.bold)
                
                ForEach(Page.services.submenu) { submenu in
                    Button(action: {
                        navigation.change(page: submenu)
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
