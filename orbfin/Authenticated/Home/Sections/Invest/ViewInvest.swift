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
            
            VStack(spacing: 30) {
                ComponentButtonHNav(page: .realestate)
                
                ComponentDivider()
                
                ComponentButtonHNav(page: .tangibleassets)
            }
        }
    }
}

#Preview {
    ViewInvest()
}
