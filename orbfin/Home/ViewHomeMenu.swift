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
            ComponentButtonHNav(viewType: .page(.manage))
            ComponentButtonHNav(viewType: .page(.invest))
            ComponentButtonHNav(viewType: .page(.services))
        }
    }
}

#Preview {
    ViewHomeMenu()
}
