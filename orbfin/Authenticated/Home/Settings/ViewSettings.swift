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
        ComponentCard {
            #if os(macOS)
                    ViewLayoutExperience()
            #else
                if UIDevice.current.userInterfaceIdiom == .pad {
                    ViewLayoutExperience()
                } else {
                    Text("Nothing to show here yet.")
                }
            #endif
        }
    }
}

#Preview {
    ViewSettings()
}
