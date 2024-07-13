//
//  ComponentButton.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentButtonBar: View {
    @StateObject private var navigation = Navigation.instance

    var label: String
    var icon: String
    
    var body: some View {
        Button(action: {
            navigation.change(view: label)
        }, label: {
            VStack {
                Image(systemName: icon)
                Text(label)
            }
        })
        .padding()
        .foregroundColor(Styling.color(.BarFont))
    }
}

#Preview {
    ComponentButtonBar(label: "Home", icon: "house")
}
