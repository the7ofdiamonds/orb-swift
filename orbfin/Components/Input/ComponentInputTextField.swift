//
//  InputTextField.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import SwiftUI

struct ComponentInputTextField: View {
    var placeholder: String = ""
    
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding()
                .background(Styling.color(.Input))
                .foregroundColor(Styling.color(.InputFont))
                .cornerRadius(Styling.cornerRadius)
                .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Styling.color(.InputFont))
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    ComponentInputTextField(placeholder: "", text: .constant(""))
}
