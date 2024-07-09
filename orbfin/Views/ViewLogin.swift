//
//  ViewLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/7/24.
//

import SwiftUI
import MapKit

struct ViewLogin: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccessful: Bool = false
    @State private var showingAlert: Bool = false

    @StateObject var locationManager = LocationManager()

    private var vm: ViewModelLogin = ViewModelLogin(locationManager: LocationManager())
    
    var body: some View {
        ZStack {
            ComponentMap()
            
            VStack {
                Spacer()
                
                Text("ORB")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                
                Button(action: {
                    vm.login(username, password)
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .background()
            .frame(width: 300, height: 300)
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Login Failed"),
                    message: Text("Incorrect username or password"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    ViewLogin()
}
