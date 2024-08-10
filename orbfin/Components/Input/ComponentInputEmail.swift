//
//  InputEmail.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

struct ComponentInputEmail: View {
    @Binding var email: String

    var body: some View {
       ComponentInputTextField(placeholder: "Email", text: $email)
    }
}

#Preview {
    ComponentInputEmail(email: .constant(""))
}
