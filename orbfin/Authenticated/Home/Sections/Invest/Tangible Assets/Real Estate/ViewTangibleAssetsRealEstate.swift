//
//  ViewTangibleAssetsRealEstate.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewTangibleAssetsRealEstate: View {
    @EnvironmentObject var vmModal: ViewModelModal

    var body: some View {
        ComponentCard {
            VStack(spacing: 30){
                ComponentButtonHNav(page: .tangibleassetscommercial)
                
                ComponentDivider()
                
                ComponentButtonHNav(page: .tangibleassetsresidential)
            }
        }
    }
}

#Preview {
    ViewTangibleAssetsRealEstate()
        .environmentObject(ViewModelModal())
}
