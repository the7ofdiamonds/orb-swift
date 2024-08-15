//
//  ViewServiceType.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/14/24.
//

import SwiftUI

struct ViewServiceType: View {
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelServices
    
    @StateObject private var location: LocationManager = LocationManager.instance
    
    var type: String
    
    var services: [Service]? {
        return vm.services
    }
    
    var body: some View {
        ZStack {
            if let services {
                ComponentCardFixed {
                    ForEach(services, id: \.id) { service in
                        if service.type == type {
                            ComponentButtonBar(page: .service(service: service))
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
                await vm.getServicesByType(type)
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

#Preview {
    ViewServiceType(type: "notary")
        .environmentObject(ViewModelModal())
        .environmentObject(ViewModelServices())
}
