//
//  ViewLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI
import MapKit

struct ViewLogin: View {
    @EnvironmentObject var authentication: Authentication

    @State private var username: String = ""
    @State private var password: String = ""
    
    @StateObject private var vm: ViewModelLogin

    init() {
        _vm = StateObject(wrappedValue: ViewModelLogin())
    }
    
    var body: some View {
            
        if !(authentication.checkAuthentication()) {
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
                    Task {
                        await vm.login(username, password)
                    }
                }
                
                HStack {
                    ComponentButtonBar(viewType: .page(.signup))
                    ComponentButtonBar(viewType: .page(.forgot))
                }
            }
            .alert(isPresented: $vm.showingAlert) {
                Alert(
                    title: Text(vm.error?.title ?? "An Error has occured."),
                    message: Text("\(vm.error?.message ?? "An Error has occured." )").foregroundColor(Styling.color(.Error)),
                    dismissButton: .default(Text("OK"))
                )
            }
        } else {
            ViewHome {
                AnyView(ViewHomeMenu())
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
