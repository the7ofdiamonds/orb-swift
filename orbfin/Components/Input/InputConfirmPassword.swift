//
//  InputConfirmPassword.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import SwiftUI

struct InputConfirmPassword: View {
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
                Text("Confirm Password")
                    .foregroundColor(Color("InputFont"))
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    InputConfirmPassword(password: .constant(""))
}
