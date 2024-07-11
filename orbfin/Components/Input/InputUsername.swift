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
       InputTextField(placeholder: "Username", text: $username)
    }
}

#Preview {
    InputUsername(username: .constant(""))
}
