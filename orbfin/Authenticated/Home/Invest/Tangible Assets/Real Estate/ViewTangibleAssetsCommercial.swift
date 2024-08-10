//
//  Commercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewTangibleAssetsCommercial: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal

    var body: some View {
        ComponentCard {
            Text("Commercial")
        }
    }
}

#Preview {
    ViewTangibleAssetsCommercial()
        .environmentObject(ViewModelModal())
}
