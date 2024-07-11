//
//  ViewLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI
import MapKit

struct ViewLogin: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    @StateObject private var vm: ViewModelLogin
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelLogin(locationManager: LocationManager()))
    }
    
    var body: some View {
        ZStack {
            if vm.locationManager.location != nil {
                ComponentMap()
            }
            
            if !vm.successfulLogin {
                VStack {
                    Spacer()
                    
                    Text("ORB")
                        .kerning(Styling.kerning)
                        .font(Styling.H1)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    InputUsername(username: $username)
                        .padding(.vertical, 10)
                    
                    InputPassword(password: $password)
                        .padding(.vertical, 10)
                        
                    Button(action: {
                        vm.login(username, password)
                    }) {
                        Text("Login")
                            .textCase(.uppercase)
                            .font(.headline)
                            .fontWeight(.bold)
                            .kerning(Styling.kerning)
                            .padding()
                            .background(Color("Button"))
                            .foregroundColor(Color("ButtonFont"))
                            .cornerRadius(Styling.cornerRadius)
                            .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: 300, maxHeight: 300)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .background(Color("Card"))
                .foregroundColor(Color("CardFont"))
                .cornerRadius(Styling.cornerRadius)
                .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
                .alert(isPresented: $vm.showingAlert) {
                    Alert(
                        title: Text("Login Failed").foregroundColor(.red),
                        message: Text("\(vm.errorMessage)").foregroundColor(Color("Error")),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            
            if !vm.successMessage.isEmpty {
                HStack{
                    Text("\(vm.successMessage)")
                        .foregroundColor(Color("Success"))
                        .padding()
                }
                .background(Color("Card"))
            }
        }
    }
}

#Preview {
    ViewLogin()
}
