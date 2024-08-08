//
//  ViewRealEstate.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewRealEstate: View {
    @EnvironmentObject var vmModal: ViewModelModal

    var body: some View {
        ComponentCardFixed {
            VStack(spacing: 30){
                ComponentButtonHNav(page: .commercial)
                
                ComponentDivider()
                
                ComponentButtonHNav(page: .residential)
            }
        }
        
    }
}

#Preview {
    ViewRealEstate()
}

struct ViewRealEstate_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewRealEstate()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelModal())

            ViewRealEstate()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelModal())
        }
    }
}
