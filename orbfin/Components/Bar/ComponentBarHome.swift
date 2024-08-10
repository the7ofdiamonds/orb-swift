//
//  ComponentBar.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ComponentBarHome: View {
    @EnvironmentObject var vmModal: ViewModelModal

    var body: some View {
        
        HStack(alignment: .center, spacing: 50) {
            ComponentButtonBar(page: .manage)
            ComponentButtonBar(page: .invest)
            ComponentButtonBar(page: .services)
        }
        .foregroundColor(Styling.color(.BarFont))
        .frame(maxWidth: 500)
        .padding(.top, 25)
        .padding(.horizontal, 25)
        .background(Styling.color(.Bar))
        .cornerRadius(Styling.cornerRadius)
    }
}

#Preview {
    ComponentBarHome()
}
