//
//  ComponentButtonHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/26/24.
//

import SwiftUI

struct ComponentButtonHome: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        Button(action: {
            navigation.change(page: .home)
        },
               label: {
            Image(systemName: Page.home.icon)
                .font(Styling.font(component: .icon))
        })
    }
}

#Preview {
    ComponentButtonHome()
}
