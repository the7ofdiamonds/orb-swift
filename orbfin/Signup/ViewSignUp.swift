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
                
                ComponentInputUsername(username: $username)
                ComponentInputEmail(email: $email)
                ComponentInputPassword(password: $password)
                ComponentInputConfirmPassword(password: $confirmPassword)
                
                ComponentDivider()
                
                HStack {
                    Text("User Preferences")
                        .kerning(Styling.kerning)
                        .font(.headline)
                        .bold()
                    Spacer()
                }
                
                ComponentInputTextField(placeholder: "Nicename", text: $nicename)
                ComponentInputTextField(placeholder: "Nickname", text: $nickname)
                
                ComponentDivider()
                
                HStack {
                    Text("Personal")
                        .kerning(Styling.kerning)
                        .font(.headline)
                        .bold()
                    Spacer()
                }

                ComponentInputTextField(placeholder: "First Name", text: $firstname)
                ComponentInputTextField(placeholder: "Last Name", text: $lastname)
                ComponentInputTextField(placeholder: "Phone Number", text: $phone)
                
                ComponentButtonH(label: Page.signup.label, icon: Page.signup.icon ?? "") {
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

struct ViewSignUp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewSignUp()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
               
            ViewSignUp()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
        }
    }
}
