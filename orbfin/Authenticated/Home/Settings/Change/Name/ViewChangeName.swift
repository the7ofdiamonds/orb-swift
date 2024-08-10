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
            ComponentBarStatus(message: vm.errorMessage, type: .error)
        }
        
        ComponentCard(title: "Change Name") {
            ComponentInputTextField(placeholder: "First Name", text: $firstName)
            ComponentInputTextField(placeholder: "Last Name", text: $lastName)
            
            ComponentButtonH(label: "Change", icon: "") {
                Task {
                    await vm.changeName(email: email, firstName: firstName, lastName: lastName)
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
    ViewChangeName()
}
