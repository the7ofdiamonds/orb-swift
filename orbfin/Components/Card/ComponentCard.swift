//
//  ComponentCard.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentCard<Content: View>: View {
    var title: String
    var content: Content
    
    init(title: String = "", @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
            VStack {
                
                if title != "" {
                    HStack {
                        Text(title)
                            .kerning(Styling.kerning)
                            .font(Styling.font(component: .title))
                            .bold()
                        Spacer()
                    }
                }
                
                ComponentDivider()

                content
            }
            .padding(Styling.padding(component: .card))
            .background(Styling.color(.Card))
            .foregroundColor(Styling.color(.CardFont))
            .cornerRadius(Styling.cornerRadius)
            .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
            .frame(maxHeight: Styling.sizeHeight(component: .card))
            
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
