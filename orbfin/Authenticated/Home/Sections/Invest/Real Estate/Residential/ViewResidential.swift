//
//  Residential.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewResidential: View {
    var body: some View {
        ComponentCardFixed {
            Text("Residential")
        }
    }
}

#Preview {
    ViewResidential()
}

struct ViewResidential_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewResidential()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
            
            ViewResidential()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
        }
    }
}
