//
//  orbfinApp.swift
//  orbfin
//
//  Created by Jamel Lyons on 1/9/24.
//

import SwiftUI
import SwiftData

@main
struct orbfinApp: App {
    var body: some Scene {
        WindowGroup {
            ViewHome()
                .environmentObject(Authentication())
        }
    }
}

#Preview {
    ViewHome()
        .environmentObject(Authentication())
}
