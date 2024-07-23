//
//  Navigation.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

@MainActor
class Navigation: ObservableObject {
    @AppStorage("lastView") var lastView: String?
    
    @Published var isPage: Page? = nil
    @Published var isMenu: Menu?
    @Published var isView: AnyView?
    
    init() {
        if let savedView = lastView,
           let page = Page(title: savedView) {
            self.isView = AuthenticationCredentials().isValid ? page.body : Page.login.body
            self.isPage = page
            self.isMenu = Menu(title: page.title)
        }
    }
    
    func change(page: Page) {
        self.isPage = page
        self.isView = AuthenticationCredentials().isValid ? page.body : Page.login.body
        self.lastView = page.title
    }
    
    func change(menu: Menu) {
        self.isMenu = menu
        
        if let page = Page(title: menu.title) {
            self.isView = AuthenticationCredentials().isValid ? page.body : Page.login.body
            self.lastView = page.title
        }
    }
}
