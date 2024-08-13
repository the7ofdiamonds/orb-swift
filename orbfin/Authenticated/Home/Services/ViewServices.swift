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
            VStack {
                ComponentCardFixed {
                    if let services {
                        ForEach(services, id: \.id) { service in
                            if let name = service.name,
                            let page = Page(title: name) {
                                ComponentButtonBar(page: page)
                            }
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    await vm.getServices(request: RequestServices())
                }
                
//                if let services = services,
//                   let coordinates = services[0].mapLocation?.coordinates {
//                    location.changeCamera(coordinates: coordinates)
//                }
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

