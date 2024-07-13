//
//  ViewModelHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import Foundation

@MainActor
class ViewModelHome: ObservableObject {
    @Published var isLoggedIn: Bool = AuthenticationCredentials().isValid

}
