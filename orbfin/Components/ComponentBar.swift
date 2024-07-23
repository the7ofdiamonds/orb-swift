//
//  ComponentBar.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentBar<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            
            content
            
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Styling.color(.Bar))
        .foregroundColor(Styling.color(.BarFont))
        .cornerRadius(Styling.cornerRadius)
        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
        

    }
}

#Preview {
    ComponentBar {
        HStack {
            Image(systemName: "key")
        }    }
}
