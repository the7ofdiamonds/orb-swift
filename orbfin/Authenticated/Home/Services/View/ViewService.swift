//
//  ViewService.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/14/24.
//

import SwiftUI

struct ViewService: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vm: ViewModelServices

    @StateObject private var location: LocationManager = LocationManager.instance
    
    var service: Service
    
    var body: some View {
        ComponentCardFixed {
            if let name = service.name {
                Text(service.name ?? "No name provided")
            }
            
            if let description = service.description {
                Text(service.description ?? "No description provided.")
            }
            
            if let features = service.features {
                Text(service.features ?? "No features have been provided.")
            }
            
            Text(Format.formatCurrency(service.price, currency: service.currency))

            Button {
                navigation.change(page: .servicerequest(service: service))
            } label: {

                if let button_icon = service.button_icon {
                    Image(systemName: button_icon)
                } else {
                    Image(systemName: "calendar.badge.clock")
                }
                
                Text("Schedule")
            }
            .padding()
            .background(Styling.color(.Button))
            .foregroundStyle(Styling.color(.ButtonFont))
            
        }
        .onAppear {
            Task {
               try await vm.getServicesByID(service.id)
            }
            
            if let coordinates = service.mapLocation?.coordinates {
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

//#Preview {
//    ViewService()
//}
