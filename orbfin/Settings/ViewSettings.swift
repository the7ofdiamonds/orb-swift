//
//  ViewSettings.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI
import SwiftData

struct ViewSettings: View {
    @State private var settings = Settings()
    @Binding var selectedLayoutExperience: LayoutExperienceSetting?
    
    var body: some View {
        ComponentCard {
            #if !os(macOS)
                if UIDevice.current.userInterfaceIdiom == .pad {
                    ViewLayoutExperience(selectedLayoutExperience: $selectedLayoutExperience)
                }
            #endif
        }
    }
}

//#Preview {
//    ViewSettings(settings: Settings(), selectedLayoutExperience: .constant(.threeColumn.rawValue))
//}
