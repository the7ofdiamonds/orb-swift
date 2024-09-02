//
//  ViewServiceRequest.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/14/24.
//

import SwiftUI

struct ViewServiceRequest: View {
    @EnvironmentObject var vmModal: ViewModelModal

    @StateObject var vm = ViewModelServiceRequest()
    @StateObject var vmSchedule = ViewModelSchedule()
    @StateObject private var locationManager: LocationManager = LocationManager.instance
    
    @State var service: Service
    
    @State private var selectedDate: Date = Date()
    @State private var selectedTime: Date = Date()
    
    @State private var streetAddress: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zipcode: String = ""
    @State private var country: String = ""
    @State private var isCurrentLocation: Bool = false
    
    private var address: Address? {
        return Address(streetAddress: streetAddress, city: city, state: state, zipcode: zipcode, country: country)
    }
    private var coordinates: Coordinates? {
        if let coordinates = locationManager.location {
           let latitude = Double(coordinates.latitude)
           let longitude = Double(coordinates.longitude)
            return Coordinates(latitude: latitude, longitude: longitude)
        } else {
            return nil
        }
    }
    
    private var formattedDate: String {
        return Format.dateFormatter.string(from: selectedDate)
    }
    
    private var formattedTime: String {
        return Format.timeFormatter.string(from: selectedTime)
    }
    
    var request: RequestService {
        return RequestService(id: service.id, type: service.type, date: vmSchedule.date, time: vmSchedule.time, price: service.price, address: address, coordinates: coordinates)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
//                At this current location? Checkbox (Use coordinates)
                
                ComponentCardFixed {
                    if !isCurrentLocation {
                        TextField("Street Address", text: $streetAddress)
                        TextField("City", text: $city)
                        TextField("State", text: $state)
                        TextField("Zipcode", text: $zipcode)
                        TextField("Country", text: $country)
                    }
                }
                
                ComponentSchedule {
                    Task {
                        do {
                            try await vm.requestService(request: request)
                        } catch {
                            print("Failed to request service: \(error)")
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
        .alert(isPresented: $vm.showingAlert) {
            Alert(
                title: Text(vm.error?.title ?? "An Error has occured."),
                message: Text("\(vm.error?.message ?? "An Error has occured." )"),
                dismissButton: .default(Text("OK"))
            )
        }
        
    }
}

//struct ViewServiceRequest_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewServiceRequest(service: Service(
//            id: "example",
//            created: nil,
//            updated: nil,
//            type: nil,
//            name: "Sample Service",
//            content: nil,
//            description: nil,
//            currency: "USD",
//            price: 0.0,
//            features: nil,
//            onboarding_link: nil,
//            icon: nil,
//            button_icon: nil,
//            action_word: nil,
//            price_id: nil,
//            url: nil,
//            address: nil,
//            coordinates: nil,
//            mapLocation: nil
//        ))
//        .previewLayout(.sizeThatFits)
//    }
//}
