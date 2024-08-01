//
//  ViewInvest.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewInvest: View {
    var body: some View {
        ComponentCardFixed {
            
            VStack(spacing: 30) {
                ComponentButtonHNav(page: .realestate)
                
                ComponentDivider()
                
                ComponentButtonHNav(page: .tangibleassets)
            }
        }
    }
}

struct ViewInvest_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewInvest()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
            
            ViewInvest()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
        }
    }
}
