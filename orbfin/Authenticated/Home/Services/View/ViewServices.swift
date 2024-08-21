//
//  ViewServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewServices: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelServices
    
    @StateObject private var location: LocationManager = LocationManager.instance
    
    var services: [Page] {
        return Page.services.submenu
    }
    
    var body: some View {
            ZStack {
                if vmModal.show {
                    ComponentCardFixed {
                        VStack(spacing: 15) {
                            ForEach(services) { service in
                                ComponentButtonHNav(page: service)
                            }
                        }
                    }
                }
                
                if vm.showStatus && vmModal.showModal {
                    ViewModal {
                        ViewStatus(
                            successMessage: vm.successMessage,
                            errorMessage: vm.errorMessage,
                            cautionMessage: vm.cautionMessage)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        if let icon = navigation.isPage?.icon {
                            Image(systemName: icon)
                        }
                        
                        Text(navigation.isPage?.title ?? "No title")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
            }
            .alert(isPresented: $vm.showingAlert) {
                Alert(
                    title: Text(vm.error?.title ?? "An Error has occured."),
                    message: Text("\(vm.error?.message ?? "An Error has occured." )").foregroundColor(Styling.color(.Error)),
                    dismissButton: .default(Text("OK"))
                )
            }
            
    }
}

struct ViewServices_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewServices()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelModal())
                .environmentObject(ViewModelServices())
            
            ViewServices()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelModal())
                .environmentObject(ViewModelServices())
        }
    }
}

