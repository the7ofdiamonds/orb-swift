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
                ComponentButtonBar(viewType: .menu(.realestate))
                ComponentButtonBar(viewType: .menu(.tangibleassets))
            }
        }
    }
}

#Preview {
    ViewInvest()
}
