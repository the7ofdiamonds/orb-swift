//
//  ComponentButton.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentButtonBar: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal

    var page: Page
    
    var body: some View {
        Button(action: {
            navigation.change(page: page)
            vmModal.show = true
        }, label: {
            VStack {
                Image(systemName: page.icon)
                    .font(Styling.font(component: .icon))

                Text(page.label)
                    .font(Styling.font(component: .label))

            }
        })
        .foregroundColor(Styling.color(.Font))
    }
}

#Preview {
    ComponentButtonBar(page: .home(successMessage: nil))
        .environmentObject(Navigation())
        .environmentObject(ViewModelModal())
}
