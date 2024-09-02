//
//  ComponentButtonContact.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/27/24.
//

import SwiftUI

struct ComponentButtonContact: View {
    var action: (@escaping () -> Void) -> Void
    
    var body: some View {
        Button(action: {
            action {
                
            }
        }, label: {
            HStack {
                Image(systemName: "person.crop.circle")
                
                Text("Contact")
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
    ComponentButtonContact { _ in
        print("Button pressed")
    }
}
