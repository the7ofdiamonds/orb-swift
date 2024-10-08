//
//  InputPassword.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import SwiftUI

struct ComponentInputPassword: View {
    @Binding var password: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            SecureField("", text: $password)
                .padding()
                .background(Color("Input"))
                .foregroundColor(Color("InputFont"))
                .cornerRadius(Styling.cornerRadius)
                .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
            
            if password.isEmpty {
                Text("Password")
                    .foregroundColor(Color("InputFont"))
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    ComponentInputPassword(password: .constant(""))
}
