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
            #if os(macOS)
                ViewLayoutExperience()
                .padding(.bottom, 30)
            #else
                if UIDevice.current.userInterfaceIdiom == .pad {
                    ViewLayoutExperience()
                        .padding(.bottom, 30)

                }
            #endif
            ViewChangeUsername()
                .padding(.bottom, 30)

            ViewChangePassword()
                .padding(.bottom, 30)

            ViewChangeName()
                .padding(.bottom, 30)

            ViewChangePhone()
                .padding(.bottom, 30)
        }
    }
}

#Preview {
    ViewSettings()
}
