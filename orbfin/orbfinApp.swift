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
    @StateObject private var authentication = Authentication()
    @StateObject private var navigation = Navigation()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authentication)
                .environmentObject(navigation)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
