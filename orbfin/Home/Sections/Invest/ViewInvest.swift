//
//  ViewInvest.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewInvest: View {
    var body: some View {
        ComponentCard {
            Text("Invest")
            
            HStack {
                ComponentButtonHNav(viewType: .page(.realestate))
                ComponentButtonHNav(viewType: .page(.tangibleassets))
            }
        }
    }
}

#Preview {
    ViewInvest()
}
