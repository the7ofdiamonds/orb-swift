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
    @EnvironmentObject var navigation: Navigation

    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var showSignUp: Bool = false
    @State private var showForgot: Bool = false

    @StateObject private var vm: ViewModelLogin

    init() {
        _vm = StateObject(wrappedValue: ViewModelLogin(authentication: Authentication(), navigation: Navigation()))
    }
    
    var body: some View {
            
        if !(vm.isLoggedIn) {
            
            if !vm.errorMessage.isEmpty {
                StatusBar(message: vm.errorMessage, type: .error)
            }
            
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
                    Button {
                        showSignUp = true
                    } label: {
                        VStack {
                            Image(systemName: Page.signup.icon)
                            Text(Page.signup.label)
                        }
                    }
                    
                    Button {
                        showForgot = true
                    } label: {
                        VStack {
                            Image(systemName: Page.forgot.icon)
                            Text(Page.forgot.label)
                        }
                    }
                }
            }
            .sheet(isPresented: $showSignUp) {
                ViewSignUp()
            }
            .sheet(isPresented: $showForgot) {
                ViewForgot()
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
}

#Preview {
    ViewLogin()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
