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
        _vm = StateObject(wrappedValue: ViewModelLogin())
    }
    
    var body: some View {
            
        if !vm.isLoggedIn {
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
                    title: Text("Login Failed"),
                    message: Text("\(vm.error?.localizedDescription ?? "An Error has occured." )").foregroundColor(Styling.color(.Error)),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        
        if !vm.successMessage.isEmpty {
            StatusBar(message: vm.successMessage, type: .success)
        }
        
        if !vm.errorMessage.isEmpty {
            StatusBar(message: vm.errorMessage, type: .error)
        }
    }
}

#Preview {
    ViewLogin()
}
