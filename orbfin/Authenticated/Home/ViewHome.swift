//
//  ViewHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI
import MapKit

struct ViewHome: View {
    @State var showStatus: Bool = true

    var successMessage: String?
    
    var body: some View {

        ComponentCardFixed {
            Text("Dashboard")
            
            ComponentDivider()
            
            HStack(spacing: 25, content: {
                ComponentButtonBar(page: .settings)
                ComponentButtonBar(page: .forgot)
                ComponentButtonBar(page: .logout)
            })
        }
        
    }
}
    
struct ViewHome_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewHome()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
            
            ViewHome()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
        }
    }
}
