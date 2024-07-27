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
            StatusBar(message: vm.errorMessage, type: .error)
        }
        
        ComponentCard {
            Text("Change Phone")
                .kerning(Styling.kerning)
            
            InputTextField(placeholder: "Phone", text: $phone)
                .padding(.vertical, 10)
                        
            ComponentButtonH(label: "Change", icon: "") {
                Task {
                    await vm.changePhone(email: email, phone: phone)
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
    ViewChangePhone()
}
