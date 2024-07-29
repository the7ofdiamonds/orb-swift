//
//  ViewSignUp.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct ViewSignUp: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var nicename: String = ""
    @State private var nickname: String = ""
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var phone: String = ""
    
    @StateObject private var vm: ViewModelSignup
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelSignup())
    }
    
    var body: some View {
        ScrollView {
            
            ComponentCard {
                HStack {
                    Text("Login Info")
                        .kerning(Styling.kerning)
                        .font(.headline)
                        .bold()
                    Spacer()
                }
                
                InputUsername(username: $username)
                InputEmail(email: $email)
                InputPassword(password: $password)
                InputConfirmPassword(password: $confirmPassword)
                
                ComponentDivider()
                
                HStack {
                    Text("User Preferences")
                        .kerning(Styling.kerning)
                        .font(.headline)
                        .bold()
                    Spacer()
                }
                
                InputTextField(placeholder: "Nicename", text: $nicename)
                InputTextField(placeholder: "Nickname", text: $nickname)
                
                ComponentDivider()
                
                HStack {
                    Text("Personal")
                        .kerning(Styling.kerning)
                        .font(.headline)
                        .bold()
                    Spacer()
                }

                InputTextField(placeholder: "First Name", text: $firstname)
                InputTextField(placeholder: "Last Name", text: $lastname)
                InputTextField(placeholder: "Phone Number", text: $phone)
                
                ComponentButtonH(label: Page.signup.label, icon: Page.signup.icon) {
                    Task {
                        await vm.signup(username: username,
                                        email: email,
                                        password: password,
                                        confirmPassword: confirmPassword,
                                        nicename: nicename,
                                        nickname: nickname,
                                        firstname: firstname,
                                        lastname: lastname,
                                        phone: phone
                        )
                    }
                }
                .padding(.top, 20)
                
            }
        }
        
        
        //        if !vm.successMessage.isEmpty {
        //            StatusBar(message: vm.successMessage, type: .success)
        //        }
        //
        //        if !vm.errorMessage.isEmpty {
        //            StatusBar(message: vm.errorMessage, type: .error)
        //        }
    }
}

#Preview {
    ViewSignUp()
}
