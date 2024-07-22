//
//  TwoColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct TwoColumnView: View {
    @EnvironmentObject var navigation: Navigation

    @State private var selectedContentMenu: ViewType? = nil
    @State private var selectedDetailView: Page? = nil
    
    var body: some View {
        NavigationSplitView {
            Text("Manage")
            List {
                ForEach(Menu.manage.submenu, id: \.label) { submenu in
                    Button(action: {
                        selectedContentMenu = submenu
                        navigation.change(view: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
            
            Text("Invest")
            List{
                ForEach(Menu.invest.submenu, id: \.label) { submenu in
                    Button(action: {
                        selectedContentMenu = submenu
                        navigation.change(view: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }

            Text("Services")
            List {
                ForEach(Menu.services.submenu, id: \.label) { submenu in
                    Button(action: {
                        selectedContentMenu = submenu
                        navigation.change(view: submenu)
                    }, label: {
                        Text(submenu.label)
                    })
                }
            }
        } detail: {
            ViewHome {
                AnyView(navigation.isView)
            }
        }

    }
}

#Preview {
    TwoColumnView()
}
