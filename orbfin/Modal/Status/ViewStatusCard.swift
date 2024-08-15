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
    
    var body: some View {
        VStack {
            Text(message)
                .padding(.top, 10)
                .font(.title)
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
    ViewStatus(successMessage: "Welcome User")
}
