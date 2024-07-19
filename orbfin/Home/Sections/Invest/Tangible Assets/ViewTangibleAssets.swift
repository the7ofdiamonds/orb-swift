//
//  ViewTangibleAssets.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewTangibleAssets: View {
    var body: some View {
        ComponentCard {
            ComponentButtonHNav(viewType:
                    .page(.tangibleassetsbusiness))
            ComponentButtonHNav(viewType:
                    .page(.tangibleassetsrealestate))
        }
    }
}

#Preview {
    ViewTangibleAssets()
}
