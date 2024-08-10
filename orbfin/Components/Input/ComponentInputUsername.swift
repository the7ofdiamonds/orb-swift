//
//  InputUsername.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import SwiftUI

struct ComponentInputUsername: View {
    @Binding var username: String

    var body: some View {
       ComponentInputTextField(placeholder: "Username", text: $username)
    }
}

#Preview {
    ComponentInputUsername(username: .constant(""))
}
