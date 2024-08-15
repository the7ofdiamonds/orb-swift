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
    @StateObject private var locationManager: LocationManager = LocationManager.instance
    
    var service: Service
    
    @State private var selectedDate: Date = Date()
    @State private var selectedTime: Date = Date()
    @State private var streetAddress: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zipcode: String = ""
    @State private var county: String = ""
    @State private var isCurrentLocation: Bool = false
    
    private var address: Address? {
        return Address(streetAddress: streetAddress, city: city, state: state, zipcode: zipcode, county: county)
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
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    private var formattedDate: String {
        return dateFormatter.string(from: selectedDate)
    }
    
    private var formattedTime: String {
        return timeFormatter.string(from: selectedTime)
    }
    
    var request: RequestService {
        return RequestService(id: service.id, date: formattedDate, time: formattedTime, address: address, coordinates: coordinates)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                ComponentCardFixed {
                    VStack {
                        DatePicker(
                            "Select Date",
                            selection: $selectedDate,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                        .frame(width: 300)
                        
                        DatePicker(
                            "Select Time",
                            selection: $selectedTime,
                            displayedComponents: [.hourAndMinute]
                        )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                    }
                }
                
                ComponentCardFixed {
                    if !isCurrentLocation {
                        TextField("Street Address", text: $streetAddress)
                        TextField("City", text: $city)
                        TextField("State", text: $state)
                        TextField("Zipcode", text: $zipcode)
                        TextField("County", text: $county)
                    }
                }
                
                ComponentCardFixed {
                    VStack {
                        Text("Selected Date: \(formattedDate)")
                            .padding()
                        
                        Text("Selected Time: \(formattedTime)")
                            .padding()
                        
                        Button(action: {
                            Task {
                                do {
                                    try await vm.requestService(request: request)
                                } catch {
                                    print("Failed to request service: \(error)")
                                }
                            }
                        }, label: {
                            Text("Request")
                        })
                        .fontWeight(.bold)
                        .kerning(Styling.kerning)
                        .padding()
                        .background(Styling.color(.Button))
                        .foregroundColor(Styling.color(.ButtonFont))
                        .cornerRadius(Styling.cornerRadius)
                        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
                        
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
