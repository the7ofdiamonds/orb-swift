//
//  ViewStatus.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/1/24.
//

import SwiftUI

struct ViewStatus: View {
    @Binding var showStatus: Bool
    
    var successMessage: String?
    var errorMessage: String?
    var cautionMessage: String?
    
    var body: some View {
        if showStatus {
            if let errorMessage = errorMessage {
                ViewStatusCard(message: errorMessage, type: .error) {
                    withAnimation {
                        showStatus.toggle()
                    }
                }
                .transition(.opacity)
            }
            
            if let cautionMessage = cautionMessage {
                ViewStatusCard(message: cautionMessage, type: .caution) {
                    withAnimation {
                        showStatus.toggle()
                    }
                }
                .transition(.opacity)
            }
            
            if let successMessage = successMessage {
                ViewStatusCard(message: successMessage, type: .success) {
                    withAnimation {
                        showStatus.toggle()
                    }
                }
                .transition(.opacity)
            }
            
        }
    }
}

struct ViewStatus_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewStatus(showStatus: .constant(true), successMessage: "Welcome User")
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
            
            ViewStatus(showStatus: .constant(true), errorMessage: "Welcome User")
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
        }
    }
}
