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

    @State var showStatus: Bool = true

    private var isLoggedIn: Bool {
        return authentication.checkAuthentication()
    }
    
    var maxWidth: CGFloat {
        #if os(macOS)
            return 500
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 350
            } else {
                return 500
            }
        #endif
    }
    
    var maxHeight: CGFloat {
        #if os(macOS)
            return 500
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 350
            } else {
                return 500
            }
        #endif
    }
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelLogin())
    }
    
    var body: some View {
        ZStack {
            
            ComponentCard(maxWidth: maxWidth, maxHeight: maxHeight) {
                Text("ORB")
                    .kerning(Styling.kerning)
                    .font(Styling.font(component: .title))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                InputUsername(username: $username)
                    .padding(.vertical, 10)
                
                InputPassword(password: $password)
                    .padding(.vertical, 10)
                
                ComponentButtonH(label: "LOGIN", icon: "key") {
                    showStatus = true

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
        
            if showStatus {
                ViewStatus(showStatus: $showStatus,
                           successMessage: vm.successMessage,
                           errorMessage: vm.errorMessage, cautionMessage: vm.cautionMessage)
            }
            
        }
    }
}

struct ViewLogin_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewLogin()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())

            ViewLogin()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
        }
    }
}

