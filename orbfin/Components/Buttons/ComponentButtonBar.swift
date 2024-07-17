//
//  ComponentButton.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentButtonBar: View {
    @StateObject private var navigation = Navigation.instance

    var page: Page
    
    var body: some View {
        Button(action: {
            navigation.change(view: page)
        }, label: {
            VStack {
                Image(systemName: page.icon)
                Text(page.label)
            }
        })
        .padding()
        .foregroundColor(Styling.color(.Font))
    }
}

#Preview {
    ComponentButtonBar(page: .home)
}
