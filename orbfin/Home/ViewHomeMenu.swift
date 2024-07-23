//
//  ViewHomeMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/20/24.
//

import SwiftUI

struct ViewHomeMenu: View {
    var body: some View {
        ComponentCard {
            ComponentButtonHNav(page: .manage)
            ComponentButtonHNav(page: .invest)
            ComponentButtonHNav(page: .services)
        }
    }
}

#Preview {
    ViewHomeMenu()
}
