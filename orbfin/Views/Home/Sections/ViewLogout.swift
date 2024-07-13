//
//  ViewLogout.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ViewLogout: View {
    @StateObject private var vm: ViewModelLogout
        
    init() {
        _vm = StateObject(wrappedValue: ViewModelLogout())
    }
    
    var body: some View {
        if vm.isLoggedIn {
            ComponentCard {
                Button(action: {
                    vm.logout()
                }) {
                    Text("Logout")
                        .textCase(.uppercase)
                        .font(.headline)
                        .fontWeight(.bold)
                        .kerning(Styling.kerning)
                        .padding()
                        .background(Styling.color(.Button))
                        .foregroundColor(Styling.color(.Button))
                        .cornerRadius(Styling.cornerRadius)
                        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
                }
            }
            .alert(isPresented: $vm.showingAlert) {
                Alert(
                    title: Text("Login Failed").foregroundColor(.red),
                    message: Text("\(vm.errorMessage)").foregroundColor(Color("Error")),
                    dismissButton: .default(Text("OK"))
                )
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
    ViewLogout()
}
