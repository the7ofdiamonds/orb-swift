//
//  ViewSignUp.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ViewSignUp: View {
    var body: some View {
        ComponentCard {
            Text("Signup")
            HStack {
                ComponentButtonBar(viewType: .page(.login))
                ComponentButtonBar(viewType: .page(.forgot))
            }
        }
        
        
//        if !vm.successMessage.isEmpty {
//            StatusBar(message: vm.successMessage, type: .success)
//        }
//        
//        if !vm.errorMessage.isEmpty {
//            StatusBar(message: vm.errorMessage, type: .error)
//        }
    }
}

#Preview {
    ViewSignUp()
}
