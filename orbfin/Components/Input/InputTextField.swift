//
//  InputTextField.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import SwiftUI

struct InputTextField: View {
    var placeholder: String = ""
    
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            SecureField("", text: $text)
                .padding()
                .background(Color("Input"))
                .foregroundColor(Color("InputFont"))
                .cornerRadius(Styling.cornerRadius)
                .textInputAutocapitalization(.never)
                .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color("InputFont"))
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    InputTextField(placeholder: "", text: .constant(""))
}
