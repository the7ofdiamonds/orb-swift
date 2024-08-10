//
//  ViewChangePhone.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import SwiftUI

struct ViewChangePhone: View {
    @State private var email: String = ""
    @State private var phone: String = ""
    
    @StateObject private var vm: ViewModelChange
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelChange())
    }
    
    var body: some View {
        if !vm.errorMessage.isEmpty {
            ComponentBarStatus(message: vm.errorMessage, type: .error)
        }
        
        ComponentCard(title: "Change Phone") {
            
            ComponentInputTextField(placeholder: "Phone", text: $phone)
                        
            ComponentButtonH(label: "Change", icon: "") {
                Task {
                    await vm.changePhone(email: email, phone: phone)
                }
            }
//            .padding(.top, 20)
            
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
    ViewChangePhone()
}
