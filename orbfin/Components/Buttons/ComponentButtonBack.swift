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
        if let prevView = prevView {
            Button(action: {
                navigation.change(page: prevView)
            }, label: {
                if let icon = prevView.icon {
                    Image(systemName: icon)
                        .font(Styling.font(component: .icon))
                        .foregroundColor(Styling.color(.BarFont))
                }
            })
        }
    }
}

#Preview {
    ComponentButtonBack()
}
