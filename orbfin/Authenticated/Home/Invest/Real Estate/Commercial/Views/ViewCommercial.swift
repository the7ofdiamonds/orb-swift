//
//  Commercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewCommercial: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelCommercial

    @StateObject private var location: LocationManager = LocationManager.instance
       
    @State var initialized: Int = 0

    var body: some View {
        Group {
            if vmModal.show {
                ScrollView {
                    VStack {
                        ComponentSearchBy()
                    }
                }
                
                if vm.showStatus {
                    ViewStatus(
                               successMessage: vm.successMessage,
                               errorMessage: vm.errorMessage, cautionMessage: vm.cautionMessage)
                }
            }
        }
        .onAppear {
            Task {
                await vm.getProperties(request: RequestProperties(propertyClass: .commercial))
            }
            
            if let properties = vm.properties,
               let property = properties.first,
               let coordinates = property.coordinates {
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

struct ViewCommercial_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCommercial()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(ViewModelCommercial())
                .environmentObject(Navigation())
            
            ViewCommercial()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(ViewModelCommercial())
                .environmentObject(Navigation())
        }
    }
}
