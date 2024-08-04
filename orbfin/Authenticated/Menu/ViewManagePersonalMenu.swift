//
//  ViewManagePersonalMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import SwiftUI

struct ViewManagePersonalMenu: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmManagePersonal: ViewModelManagePersonal
    
    var body: some View {
        Section {
            List {
                ComponentButtonMenu(menu: .personal)
                    .fontWeight(.bold)
                
                ForEach(Page.personal.submenu) { menu in
                        Button(action: {
                            navigation.browse(page: menu)
                        }, label: {
                            HStack {
                                Text(menu.label)
                                Text(vmManagePersonal.getManagePersonalData(page: menu))
                            }
                        })
                        .font(.headline)
                }
            }
        }
        
    }
}

#Preview {
    ViewManagePersonalMenu()
}
