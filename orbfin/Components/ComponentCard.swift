//
//  ComponentCard.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentCard<Content: View>: View {
    var content: Content
    var title: String
    
    init(title: String = "", @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            if title != "" {
                HStack {
                    Text(title)
                        .kerning(Styling.kerning)
                        .font(.headline)
                        .bold()
                    Spacer()
                }
            }
            
            Spacer()
          
            content
            
            Spacer()
        }
        .padding()
        .background(Styling.color(.Card))
        .foregroundColor(Styling.color(.CardFont))
        .cornerRadius(Styling.cornerRadius)
        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
        .padding([.horizontal, .top])
        .frame(minWidth: 400)
        .fixedSize(horizontal: true, vertical: true)
    }
}

#Preview {
    ComponentCard(title: "title") {
        Text("Hello, World!")
            .padding()
            .foregroundColor(Styling.color(.CardFont))
            .cornerRadius(Styling.cornerRadius)
    }
}
