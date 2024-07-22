//
//  ComponentButton.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentButtonBar: View {
    @EnvironmentObject var navigation: Navigation

    var viewType: ViewType
    
    var body: some View {
        Button(action: {
            navigation.change(view: viewType)
        }, label: {
            VStack {
                Image(systemName: viewType.icon)
                Text(viewType.label)
            }
        })
        .padding()
        .foregroundColor(Styling.color(.Font))
    }
}

#Preview {
    ComponentButtonBar(viewType: .page(.home))
}
