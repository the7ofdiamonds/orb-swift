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
    @StateObject private var vmModal = ViewModelModal()
    @StateObject private var vmCommercial = ViewModelCommercial()
    @StateObject private var vmCommercialProperty = ViewModelCommercialProperty()
    @StateObject private var vmResidential = ViewModelResidential()
    @StateObject private var vmResidentialProperty = ViewModelResidentialProperty()
    @StateObject private var vmManagePersonal = ViewModelManagePersonal()
    @StateObject private var vmManageBusiness = ViewModelManageBusiness()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authentication)
                .environmentObject(navigation)
                .environmentObject(vmModal)
                .environmentObject(vmCommercial)
                .environmentObject(vmCommercialProperty)
                .environmentObject(vmResidential)
                .environmentObject(vmResidentialProperty)
                .environmentObject(vmManagePersonal)
                .environmentObject(vmManageBusiness)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
        .environmentObject(ViewModelModal())
        .environmentObject(ViewModelCommercial())
        .environmentObject(ViewModelCommercialProperty())
        .environmentObject(ViewModelResidential())
        .environmentObject(ViewModelResidentialProperty())
        .environmentObject(ViewModelManagePersonal())
        .environmentObject(ViewModelManageBusiness())
}
