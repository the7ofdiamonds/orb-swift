//
//  Residential.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewTangibleAssetsResidential: View {
    @EnvironmentObject var vmModal: ViewModelModal

    var body: some View {
        ComponentCard {
            Text("Residentials")
        }
    }
}

#Preview {
    ViewTangibleAssetsResidential()
        .environmentObject(ViewModelModal())
}
