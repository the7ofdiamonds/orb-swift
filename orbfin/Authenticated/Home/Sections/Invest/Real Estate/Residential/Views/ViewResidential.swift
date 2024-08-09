//
//  Residential.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewResidential: View {
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelResidential
    @EnvironmentObject var navigation: Navigation

    @StateObject private var location: LocationManager = LocationManager.instance
    
    var properties: [RealEstateProperty]? {
        return vm.properties
    }
    
    @State var showStatus: Bool = true

    var body: some View {
        Group {
            if vmModal.show {
                ComponentSearchBy()

                if let properties {
                    ComponentCardResults(properties: properties)
                }
            }
            
            if showStatus {
                ViewStatus(showStatus: $showStatus,
                           successMessage: vm.successMessage,
                           errorMessage: vm.errorMessage, cautionMessage: vm.cautionMessage)
            }
        }
        .onAppear {
            Task {
                await vm.getProperties(request: RequestProperties(propertyClass: "residential"))
            }
            
            if let properties, let coordinates = properties[0].coordinates {
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

struct ViewResidential_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewResidential()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(ViewModelResidential())
                .environmentObject(Navigation())
            
            ViewResidential()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(ViewModelResidential())
                .environmentObject(Navigation())
        }
    }
}
