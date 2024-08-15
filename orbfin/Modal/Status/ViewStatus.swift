//
//  ViewStatus.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/1/24.
//

import SwiftUI

struct ViewStatus: View {
    var successMessage: String?
    var errorMessage: String?
    var cautionMessage: String?
    
    var type: Status? {
        if successMessage != nil {
            return .success
        }
        
        if cautionMessage != nil {
            return .caution
        }
        
        if errorMessage != nil {
            return .error
        }
        
        return nil
    }
    
    var message: String? {
        if let successMessage = successMessage {
            return successMessage
        }
        
        if let cautionMessage = cautionMessage {
            return cautionMessage
        }
        
        if let errorMessage = errorMessage {
            return errorMessage
        }
        
        return nil
    }
    
    var body: some View {
        if let message = message,
           let type = type {
            ViewStatusCard(message: message, type: type)
            .transition(.opacity)
        }
          
    }
}

struct ViewStatus_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewStatus(successMessage: "Welcome User")
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
            
            ViewStatus(errorMessage: "Welcome User")
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
        }
    }
}
