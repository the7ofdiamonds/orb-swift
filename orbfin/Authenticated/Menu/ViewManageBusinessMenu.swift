//
//  ViewManageBusinessMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import SwiftUI

struct ViewManageBusinessMenu: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        Section {
            List {
                ComponentButtonMenu(menu: .business)
                    .fontWeight(.bold)
                
                ForEach(Page.business.submenu) { menu in
                        Button(action: {
                            navigation.browse(page: menu)
                        }, label: {
                            Text(menu.label)
                        })
                        .font(.headline)
                }
            }
        }    }
}

#Preview {
    ViewManageBusinessMenu()
}
