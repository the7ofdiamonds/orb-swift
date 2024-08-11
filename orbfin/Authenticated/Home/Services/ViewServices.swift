//
//  ViewServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewServices: View {
    @EnvironmentObject var vmModal: ViewModelModal

    var body: some View {
        if vmModal.show {
            ComponentCard {
                HStack {
                    ComponentButtonBar(page: .notary)
                }
            }
        }
    }
}

struct ViewServices_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewServices()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(ViewModelModal())
            
            ViewServices()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(ViewModelModal())
        }
    }
}

