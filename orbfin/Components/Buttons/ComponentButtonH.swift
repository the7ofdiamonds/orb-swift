//
//  ComponentButtonH.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentButtonH: View {
    var label: String
    var icon: String
    var action: () -> Void
    
    init(label: String, icon: String, action: @escaping () -> Void) {
        self.label = label
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            _ = action()
        }, label: {
            HStack {
                Image(systemName: icon)
                    .font(Styling.font(component: .icon))
                
                Text(label)
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
    ComponentButtonH(label: "Home", icon: "house") {
    }
}
