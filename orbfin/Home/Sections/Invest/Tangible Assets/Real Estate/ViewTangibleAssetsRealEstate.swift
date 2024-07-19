//
//  ViewTangibleAssetsRealEstate.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewTangibleAssetsRealEstate: View {
    var body: some View {
        ComponentCard {
            ComponentButtonHNav(viewType: .page(.tangibleassetscommercial))
            ComponentButtonHNav(viewType: .page(.tangibleassetsresidential))
        }
    }
}

#Preview {
    ViewTangibleAssetsRealEstate()
}
