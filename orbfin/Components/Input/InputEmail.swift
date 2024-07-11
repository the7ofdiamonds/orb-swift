//
//  InputEmail.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

struct InputEmail: View {
    @Binding var email: String

    var body: some View {
       InputTextField(placeholder: "Email", text: $email)
    }
}

#Preview {
    InputEmail(email: .constant(""))
}
