//
//  ViewChangePassword.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import SwiftUI

struct ViewChangePassword: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    @StateObject private var vm: ViewModelChange
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelChange())
    }
    
    var body: some View {
        if !vm.errorMessage.isEmpty {
            StatusBar(message: vm.errorMessage, type: .error)
        }
        
        ComponentCard {
            Text("Change Password")
                .kerning(Styling.kerning)
            
            InputPassword(password: $password)
                .padding(.vertical, 10)
            
            InputConfirmPassword(password: $confirmPassword)
                .padding(.vertical, 10)
            
            ComponentButtonH(label: "Change", icon: "") {
                Task {
                    await vm.changePassword(password: password, confirmPassword: confirmPassword)
                }
            }
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
    ViewChangePassword()
}
