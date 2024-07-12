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
    
    let isLoggedIn: Bool = AuthenticationCredentials().isValid

    @StateObject private var vm: ViewModelLogin

    init() {
        _vm = StateObject(wrappedValue: ViewModelLogin())
    }
    
    var body: some View {
            
        if !isLoggedIn {
            ComponentCard {
                Text("ORB")
                    .kerning(Styling.kerning)
                    .font(Styling.H1)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                InputUsername(username: $username)
                    .padding(.vertical, 10)
                
                InputPassword(password: $password)
                    .padding(.vertical, 10)
                
                ComponentButtonH(label: "Login", icon: "key") {
                    vm.login(username, password)
                }
            }
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

#Preview {
    ViewLogin()
}
