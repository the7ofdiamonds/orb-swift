//
//  ViewStatusCard.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/1/24.
//

import SwiftUI

struct ViewStatusCard: View {
    var message: String
    var type: Status = .info
    var onDismiss: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    onDismiss()
                } label: {
                    HStack {
                        Text("Dismiss")
                        Image(systemName: "x.circle")
                    }
                }
            }
            .frame(maxWidth: Styling.sizeWidth(component: .card))
            
            Text(message)
                .padding(.top, 10)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .padding()
        .background(Styling.colorStatusBackground(type: type))
        .foregroundColor(Styling.colorStatusFont(type: type))
        .cornerRadius(Styling.cornerRadius)
        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
        .frame(maxWidth: Styling.sizeWidth(component: .card), maxHeight: Styling.sizeHeight(component: .card))
        .fixedSize()

    }
}

#Preview {
    ViewStatus(showStatus: .constant(true), successMessage: "Welcome User")
}
