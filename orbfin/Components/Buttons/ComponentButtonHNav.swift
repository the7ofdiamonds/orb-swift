//
//  ComponentButtonHNav.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ComponentButtonHNav: View {
    @EnvironmentObject var navigation: Navigation

    var viewType: ViewType

    var body: some View {
        Button(action: {
            navigation.change(view: viewType)
        }, label: {
            VStack{
                Text(viewType.label)
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

//#Preview {
//    ComponentButtonHNav(viewType: Page.income)
//}
