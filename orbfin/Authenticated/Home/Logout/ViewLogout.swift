//
//  ViewLogout.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ViewLogout: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation

    @StateObject private var vm: ViewModelLogout
    
   private var isLoggedIn: Bool {
        return authentication.isValid
   }
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelLogout())
    }
    
    var body: some View {
        ComponentCardFixed {
            Button(action: {
                Task{
                    try await vm.logout()
                }
            }) {
                Text("Logout")
                    .textCase(.uppercase)
                    .font(.headline)
                    .fontWeight(.bold)
                    .kerning(Styling.kerning)
                    .padding()
                    .background(Styling.color(.Button))
                    .foregroundColor(Styling.color(.ButtonFont))
                    .cornerRadius(Styling.cornerRadius)
                    .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
            }
        }
        .alert(isPresented: $vm.showingAlert) {
            Alert(
                title: Text(vm.error?.title ?? "An Error has occured."),
                message: Text("\(vm.error?.message ?? "An Error has occured." )").foregroundColor(Styling.color(.Error)),
                dismissButton: .default(Text("OK"))
            )
        }
        
        if !vm.successMessage.isEmpty {
            ComponentBarStatus(message: vm.successMessage, type: .success)
        }
        
        if !vm.errorMessage.isEmpty {
            ComponentBarStatus(message: vm.errorMessage, type: .error)
        }
    }
}

struct ViewLogout_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewLogout()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
            
            ViewLogout()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
        }
    }
}
