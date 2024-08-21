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
            navigation.change(page: .home(successMessage: nil))
        },
               label: {
            if let icon = Page.home(successMessage: nil).icon {
                Image(systemName: icon)
                    .font(Styling.font(component: .icon))
            }
        })
    }
}

#Preview {
    ComponentButtonHome()
}
