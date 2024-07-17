//
//  Navigation.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

@MainActor
class Navigation: ObservableObject {
    @ObservedObject var authentication: Authentication = Authentication()
    
    public static let instance = Navigation()
    
    @AppStorage("lastView") private var lastView: String?
    
    @Published var isView: Page?
    
    init() {
        self.authentication = authentication
        
        if let savedView = lastView, let page = Page(rawValue: savedView) {
            self.isView = authentication.checkAuthentication() ? page : .login
        } else {
            self.isView = authentication.checkAuthentication() ? .home : .login
        }
    }
    
    func change(view: Page) {
        self.isView = view
        self.lastView = view.rawValue
    }
}
