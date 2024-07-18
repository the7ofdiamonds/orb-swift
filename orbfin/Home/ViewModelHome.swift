//
//  ViewModelHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import Foundation
import SwiftUI

@MainActor
class ViewModelHome: ObservableObject {
    @ObservedObject var authentication: Authentication = Authentication()

    @Published var isLoggedIn: Bool?
    
    init(isLoggedIn: Bool? = nil) {
        self.isLoggedIn = authentication.checkAuthentication()
        print("isLoggedIn: \(self.isLoggedIn ?? false)")
    }
    
    func checkAuthenticationStatus() -> Bool {
            let credentials = AuthenticationCredentials()
            self.isLoggedIn = credentials.isValid
        return authentication.checkAuthentication()
    }
}
