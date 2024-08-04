//
//  ComponentButtonMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/3/24.
//

import SwiftUI

struct ComponentButtonMenu: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty

    var menu: Page
    var properties: [Commercial]? {
        if let properties = vmCommercial.properties {
            return properties
        } else {
            return nil
        }
    }
    
    var body: some View {
        Button(action: {
            switch menu {
            case .commercial where (properties != nil):
                navigation.change(page: .commercial)
            default:
                navigation.change(page: menu)
            }
        }, label: {
            Text(menu.label)
        })
        .font(.headline)
    }
}

#Preview {
    ComponentButtonMenu(menu: Page.personal)
        .environmentObject(Navigation())
}
