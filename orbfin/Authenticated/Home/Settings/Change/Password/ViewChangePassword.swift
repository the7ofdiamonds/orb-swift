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
            ComponentBarStatus(message: vm.errorMessage, type: .error)
        }
        
        VStack {
            ComponentCard(title: "Change Password") {
                ComponentInputPassword(password: $password)
                ComponentInputConfirmPassword(password: $confirmPassword)
                
                ComponentButtonH(label: "Change", icon: "") {
                    Task {
                        await vm.changePassword(password: password, confirmPassword: confirmPassword)
                    }
                }
//                .padding(.top, 20)
                
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
    ViewChangePassword()
}
