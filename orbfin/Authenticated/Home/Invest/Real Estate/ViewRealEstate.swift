//
//  ViewRealEstate.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewRealEstate: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelRealEstate
    
    @StateObject private var location: LocationManager = LocationManager.instance
       
    var body: some View {
        ZStack {
            if vmModal.show {
                ScrollView {
                    VStack(spacing: 30) {
                        ComponentSearchByPropertyID()
                        
                        ComponentSearchByAPN()
                        
                        ComponentCardFixed {
                            VStack(spacing: 15){
                                ComponentButtonHNav(page: .commercial)
                                
                                ComponentDivider()
                                
                                ComponentButtonHNav(page: .residential)
                            }
                        }

                        ComponentSearchBy()
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
        .onChange(of: vm.properties, {
            if let properties = vm.properties,
               let property = properties.first,
               let coordinates = property.coordinates {
                location.changeCamera(coordinates: coordinates)
            }
        })
        .alert(isPresented: $vm.showingAlert) {
            Alert(
                title: Text(vm.error?.title ?? "An Error has occured."),
                message: Text("\(vm.error?.message ?? "An Error has occured." )"),
                dismissButton: .default(Text("OK"))
            )
        }

    }
}

struct ViewRealEstate_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewRealEstate()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelModal())
                .environmentObject(ViewModelRealEstate())
            
            ViewRealEstate()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelModal())
                .environmentObject(ViewModelRealEstate())
        }
    }
}
