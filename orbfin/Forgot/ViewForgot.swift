//
//  ViewForgot.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ViewForgot: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    @StateObject private var vm: ViewModelForgot
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelForgot())
    }
    
    var body: some View {
        ComponentCard {
            VStack(spacing: 20) {
                InputUsername(username: $username)
                
                HStack {
                    VStack {
                        ComponentDivider()
                    }
                    
                    Text("or")
                        .font(.headline)
                        .fontWeight(.bold)
                        .kerning(Styling.kerning)
                    VStack {
                        ComponentDivider()
                    }
                }
                
                InputEmail(email: $email)
            }
            
            ComponentButtonH(label: "FORGOT", icon: "questionmark.circle") {
                vm.password(username: username, email: email)
            }
            .padding(.top, 20)
            
            HStack {
                if !(vm.isLoggedIn ?? true) {
                    ComponentButtonBar(page: .login)
                    ComponentButtonBar(page: .signup)
                }
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

struct ViewForgot_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewForgot()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
               
            ViewForgot()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
        }
    }
}
