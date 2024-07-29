//
//  ComponentButtonBack.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/28/24.
//

import SwiftUI

struct ComponentButtonBack: View {
    @EnvironmentObject var navigation: Navigation

    var prevView: Page? {
        return navigation.isPage?.parent
    }
    
    var body: some View {
        if navigation.isPage != .home,
           let prevView = prevView {
            Button(action: {
                navigation.change(page: prevView)
            }, label: {
                Image(systemName: prevView.icon)
                    .font(Styling.font(component: .icon))
                    .foregroundColor(Styling.color(.BarFont))
            })
        }
    }
}

#Preview {
    ComponentButtonBack()
}
