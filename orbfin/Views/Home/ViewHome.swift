//
//  ViewHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI
import MapKit

struct ViewHome: View {
    @StateObject private var vm: ViewModelHome

    @StateObject private var navigation = Navigation.instance
        
    init() {
        _vm = StateObject(wrappedValue: ViewModelHome())
    }
    
    var body: some View {
        
    ZStack {
        ComponentMap()
        
        VStack {
            if navigation.isView == "Login" {
                ViewLogin()
            }
            
            if navigation.isView == "Signup" {
                ViewSignUp()
            }
            
            if navigation.isView == "Forgot" {
                ViewForgot()
            }
            
            if navigation.isView == "Logout" {
                ViewLogout()
            }
        }

        VStack {
            Spacer()
            ComponentBar {
                if !vm.isLoggedIn {
                    ComponentButtonBar(label: "Login", icon: "key")
                    ComponentButtonBar(label: "Signup", icon: "plus.circle")
                }
                
                ComponentButtonBar(label: "Forgot", icon: "questionmark.circle")
                
                if vm.isLoggedIn {
                    ComponentButtonBar(label: "Logout", icon: "key.slash")
                }
            }
        }
        .ignoresSafeArea()

        }
    }
}

#Preview {
    ViewHome()
}
