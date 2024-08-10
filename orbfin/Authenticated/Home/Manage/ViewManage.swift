//
//  ViewManage.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManage: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal

    var body: some View {
        ComponentCardFixed {
            VStack(spacing: 20, content: {
                ComponentButtonHNav(page: .personal)
                ComponentButtonHNav(page: .business)
            })
        }
    }
}

struct ViewManage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewManage()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(ViewModelModal())
                .environmentObject(Navigation())

            ViewManage()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(ViewModelModal())
                .environmentObject(Navigation())
        }
    }
}
