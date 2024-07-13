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
            InputUsername(username: $username)
            
            InputEmail(email: $email)
            
            ComponentButtonH(label: "Forgot", icon: "questionmark.circle") {
                vm.password(username: username, email: email)
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
    ViewForgot()
}
