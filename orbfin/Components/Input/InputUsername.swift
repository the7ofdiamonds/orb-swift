//
//  InputUsername.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import SwiftUI

struct InputUsername: View {
    @Binding var username: String

    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $username)
                .padding()
                .background(Color("Input"))
                .cornerRadius(Styling.cornerRadius)
                .textInputAutocapitalization(.never)
                .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
            
            if username.isEmpty {
                Text("Username")
                    .foregroundColor(Color("InputFont"))
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    InputUsername(username: .constant(""))
}
