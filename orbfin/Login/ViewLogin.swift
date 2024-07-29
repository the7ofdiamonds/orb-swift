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

    private var isLoggedIn: Bool {
        return authentication.isValid
    }
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelLogin())
    }
    
    var body: some View {
        ZStack {
            ComponentMap()
            
            if !isLoggedIn {
                
                if !vm.errorMessage.isEmpty {
                    StatusBar(message: vm.errorMessage, type: .error)
                }
                
                ComponentCard {
                    Text("ORB")
                        .kerning(Styling.kerning)
                        .font(Styling.font(component: .title))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    InputUsername(username: $username)
                        .padding(.vertical, 10)
                    
                    InputPassword(password: $password)
                        .padding(.vertical, 10)
                    
                    ComponentButtonH(label: "LOGIN", icon: "key") {
                        Task {
                            await vm.login(username, password)
                        }
                    }
                    .padding(.top, 10)
                    
                    Divider()
                        .background(Styling.color(.CardFont))
                        .padding()
                    
                    HStack(spacing: 50) {
                        Button {
                            showSignUp = true
                        } label: {
                            VStack {
                                Image(systemName: Page.signup.icon)
                                    .font(Styling.font(component: .icon))
                                
                                Text(Page.signup.label)
                                    .font(Styling.font(component: .label))
                            }
                        }
                        
                        Button {
                            showForgot = true
                        } label: {
                            VStack {
                                Image(systemName: Page.forgot.icon)
                                    .font(Styling.font(component: .icon))
                                
                                Text(Page.forgot.label)
                                    .font(Styling.font(component: .label))
                            }
                        }
                    }
                }
                .sheet(isPresented: $showSignUp) {
                    ViewSignUp()
                }
                .sheet(isPresented: $showForgot) {
                    ViewForgot()
                        .presentationDetents([.fraction(0.5)])
                }
                .alert(isPresented: $vm.showingAlert) {
                    Alert(
                        title: Text(vm.error?.title ?? "An Error has occured."),
                        message: Text("\(vm.error?.message ?? "An Error has occured." )").foregroundColor(Styling.color(.Error)),
                        dismissButton: .default(Text("OK"))
                    )
                }
                
            } else {
                ViewHome()
            }
        }
    }
}

#Preview {
    ViewLogin()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
