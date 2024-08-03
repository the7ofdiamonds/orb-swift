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
    @StateObject private var vmCommercial = ViewModelCommercial()
    @StateObject private var vmCommercialProperty = ViewModelCommercialProperty()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authentication)
                .environmentObject(navigation)
                .environmentObject(vmCommercial)
                .environmentObject(vmCommercialProperty)

        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
        .environmentObject(ViewModelCommercial())
}
