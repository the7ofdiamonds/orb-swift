//
//  ViewServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewServices: View {
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelServices
    
    @StateObject private var location: LocationManager = LocationManager.instance
    
    var services: [Service]? {
        return vm.services
    }
    
    var body: some View {
        if vmModal.show {
            ZStack {
                if let services = services {
                    ComponentCardFixed {
                        ForEach(services, id: \.id) { service in
                            if let type = service.type {
                                ComponentButtonBar(page: Page.serviceType(type: type))
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
            .onAppear {
                Task {
                    await vm.getServices()
                }
                
                if let services = services,
                   let service = services.first,
                   let coordinates = service.mapLocation?.coordinates {
                    location.changeCamera(coordinates: coordinates)
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
}

struct ViewServices_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewServices()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(ViewModelModal())
            
            ViewServices()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(ViewModelModal())
        }
    }
}

