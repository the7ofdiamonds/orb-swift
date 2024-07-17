//
//  ComponentButtonDoubleH.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ComponentButtonDoubleH: View {
    @StateObject private var navigation = Navigation.instance

    var page: Page
    var value: String
    
    private var label: String
    
    init(page: Page, value: String) {
        self.page = page
        self.label = page.label
        self.value = value
    }
    
    var body: some View {
        Button(action: {
            navigation.change(view: page)
        }, label: {
            VStack{
                Text(label)
                Text(value)
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
    ComponentButtonDoubleH(page: Page.income, value: "$100,000")
}
