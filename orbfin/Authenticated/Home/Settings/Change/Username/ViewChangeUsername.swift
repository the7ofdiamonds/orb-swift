//
//  ViewChangeUsername.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import SwiftUI

struct ViewChangeUsername: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""

    @StateObject private var vm: ViewModelChange
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelChange())
    }
    
    var body: some View {
        if !vm.errorMessage.isEmpty {
            StatusBar(message: vm.errorMessage, type: .error)
        }
        
        ComponentCard(title: "Change Username") {
            InputEmail(email: $email)

            InputPassword(password: $password)
            
            InputUsername(username: $username)
            
            ComponentButtonH(label: "Change", icon: "") {
                Task {
                    await vm.changeUsername(email: email, password: password, username: username)
                }
            }
            .padding(.top, 20)
            
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

#Preview {
    ViewChangeUsername()
}
