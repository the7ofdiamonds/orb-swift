//
//  ComponentButtonHNav.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ComponentButtonHNav: View {
    @StateObject private var navigation = Navigation.instance
    
    var page: Page

    var body: some View {
        Button(action: {
            navigation.change(view: page)
        }, label: {
            VStack{
                Text(page.label)
            }
        })
        .font(.headline)
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
    ComponentButtonHNav(page: Page.income)
}
