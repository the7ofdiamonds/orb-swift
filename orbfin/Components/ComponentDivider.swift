//
//  ComponentDivider.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/28/24.
//

import SwiftUI

struct ComponentDivider: View {
    var body: some View {
        Divider()
            .background(Styling.color(.CardFont))
            .padding()
    }
}

#Preview {
    ComponentDivider()
}
