//
//  ComponentCard.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentCard<Content: View>: View {
    var title: String
    var maxWidth: CGFloat
    var content: Content
    
    init(title: String = "", maxWidth: CGFloat = 400, @ViewBuilder content: () -> Content) {
        self.title = title
        self.maxWidth = maxWidth
        self.content = content()
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                
                if title != "" {
                    HStack {
                        Text(title)
                            .kerning(Styling.kerning)
                            .font(Styling.font(component: .title))
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
            .frame(maxWidth: maxWidth)
//            .fixedSize(horizontal: true, vertical: false)
        }
        .padding()
        
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
