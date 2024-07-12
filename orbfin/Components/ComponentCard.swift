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
        VStack {
            Spacer()
            
            content
            
            Spacer()
        }
        .frame(maxWidth: 300, maxHeight: 300)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Color("Card"))
        .foregroundColor(Color("CardFont"))
        .cornerRadius(Styling.cornerRadius)
        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
    }
}

#Preview {
    ComponentCard {
        Text("Hello, World!")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(Styling.cornerRadius)
    }
}
