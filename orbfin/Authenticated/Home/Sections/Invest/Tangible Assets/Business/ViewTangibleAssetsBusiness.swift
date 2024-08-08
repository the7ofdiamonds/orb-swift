//
//  Business.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewTangibleAssetsBusiness: View {
    @EnvironmentObject var vmModal: ViewModelModal

    var body: some View {
        ComponentCard {
            Text("Business")
        }
    }
}

#Preview {
    ViewTangibleAssetsBusiness()
        .environmentObject(ViewModelModal())
}
