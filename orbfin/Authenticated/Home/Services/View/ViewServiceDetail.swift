//
//  ViewService.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/14/24.
//

import SwiftUI

struct ViewServiceDetail: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vm: ViewModelServices

    @StateObject private var location: LocationManager = LocationManager.instance
    
    @State var service: Service
    
    var body: some View {
        ComponentCardFixed {
            if let name = service.name {
                Text(name)
            }
            
            if let description = service.description {
                Text(description)
            }
            
            if let features = service.features {
                Text(features)
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
            .fontWeight(.bold)
            .kerning(Styling.kerning)
            .foregroundColor(Styling.color(.ButtonFont))
            .cornerRadius(Styling.cornerRadius)
            .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
        }
        .onChange(of: vm.service, {
            if let service = vm.service,
                let coordinates = service.mapLocation?.coordinates {
                location.changeCamera(coordinates: coordinates)
            }
        })
        .onAppear {
            Task {
                try await vm.getServiceByID(service.id)
            }
        }
        .alert(isPresented: $vm.showingAlert) {
            Alert(
                title: Text(vm.error?.title ?? "An Error has occured."),
                message: Text("\(vm.error?.message ?? "An Error has occured." )")
                    .foregroundColor(Styling.color(.Error)),
                dismissButton: .default(Text("OK"))
            )
        }
        
    }
}

//#Preview {
//    ViewService()
//}
