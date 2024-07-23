//
//  ViewSettings.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI
import SwiftData

struct ViewSettings: View {
    @State var settings = Settings()
    
    var body: some View {
        ComponentCard {
            #if os(macOS)
                    ViewLayoutExperience(selectedLayoutExperience: settings.$layoutExperience)
            #else
                if UIDevice.current.userInterfaceIdiom == .pad {
                    ViewLayoutExperience(selectedLayoutExperience: settings.$layoutExperience)
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
