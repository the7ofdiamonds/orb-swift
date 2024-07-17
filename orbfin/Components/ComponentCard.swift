//
//  ComponentCard.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentCard<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
            Spacer()
            
            content
            
            Spacer()
        }
        .padding()
//        .frame(maxWidth: 300, maxHeight: 350)
//        .padding(.horizontal, 20)
//        .padding(.vertical, 20)
        .background(Styling.color(.Card))
        .foregroundColor(Styling.color(.CardFont))
        .cornerRadius(Styling.cornerRadius)
        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
        .padding([.horizontal, .top])
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    ComponentCard {
        Text("Hello, World!")
            .padding()
            .foregroundColor(Styling.color(.CardFont))
            .cornerRadius(Styling.cornerRadius)
    }
}
