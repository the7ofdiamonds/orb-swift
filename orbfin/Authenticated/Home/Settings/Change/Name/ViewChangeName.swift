//
//  ViewChangeName.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import SwiftUI

struct ViewChangeName: View {
    @State private var email: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    @StateObject private var vm: ViewModelChange
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelChange())
    }
    
    var body: some View {
        if !vm.errorMessage.isEmpty {
            StatusBar(message: vm.errorMessage, type: .error)
        }
        
        ComponentCard {
            Text("Change Name")
                .kerning(Styling.kerning)
            
            InputTextField(placeholder: "First Name", text: $firstName)
                .padding(.vertical, 10)
            
            InputTextField(placeholder: "Last Name", text: $lastName)
                .padding(.vertical, 10)
            
            ComponentButtonH(label: "Change", icon: "") {
                Task {
                    await vm.changeName(email: email, firstName: firstName, lastName: lastName)
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
    ViewChangeName()
}
