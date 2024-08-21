//
//  ComponentButtonHNav.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ComponentButtonHNav: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal

    var page: Page

    var body: some View {
        Button(action: {
            navigation.change(page: page)
            vmModal.show = true
        }, label: {
            HStack {
                if let icon = page.icon {
                    Image(systemName: icon)
                }
                
                Text(page.label)
                    .font(Styling.font(component: .label))
            }
        })
        .fontWeight(.bold)
        .kerning(Styling.kerning)
        .padding()
        .background(Styling.color(.Button))
        .foregroundColor(Styling.color(.ButtonFont))
        .cornerRadius(Styling.cornerRadius)
        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
    }
}

#Preview {
    ComponentButtonHNav(page: Page.home(successMessage: nil))
}
