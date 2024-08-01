//
//  ViewSettings.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI
import SwiftData

struct ViewSettings: View {
    
    var body: some View {
            ScrollView {
                VStack(spacing: 25) {
                    #if os(macOS)
                        ViewLayoutExperience()
                    #else
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            ViewLayoutExperience()
                        }
                    #endif
                    ViewChangeUsername()
                    
                    ViewChangePassword()
                    
                    ViewChangeName()
                    
                    ViewChangePhone()
            }
        }
    }
}

struct ViewSettings_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewSettings()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
            
            ViewSettings()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
        }
    }
}
