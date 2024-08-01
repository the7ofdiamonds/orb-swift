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

#Preview {
    ViewSettings()
}
