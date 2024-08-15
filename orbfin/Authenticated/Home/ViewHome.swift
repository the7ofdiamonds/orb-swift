//
//  ViewHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI
import MapKit

struct ViewHome: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal

    @State var successMessage: String?
    
    var body: some View {

        ComponentCardFixed {
            Text("Dashboard")
            
            ComponentDivider()
            
            HStack(spacing: 25) {
                ComponentButtonBar(page: .settings)
                ComponentButtonBar(page: .forgot)
                ComponentButtonBar(page: .logout)
            }
        }
        .overlay {
            if vmModal.showModal {
                ViewModal {
                    ViewStatus(successMessage: successMessage)
                }
            }
        }
        
        
        
    }
}
    
struct ViewHome_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewHome(successMessage: "Welcome Username")
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(ViewModelModal())
                .environmentObject(Navigation())
            
            ViewHome(successMessage: "Welcome Username")
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(ViewModelModal())
                .environmentObject(Navigation())
        }
    }
}
