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
    
    @Published var isPage: Page?
    @Published var isMenu: Menu?
    @Published var isSubMenu: [Menu]?
    @Published var isView: AnyView?
    
    init() {
        if let savedView = lastView,
           let page = Page(title: savedView) {
            self.isView = page.body
            self.isPage = page
            self.isMenu = Menu(title: page.title)
            self.isSubMenu = isMenu?.submenu
        }
    }
    
    func change(page: Page) {
        self.isPage = page
        self.isView = Authentication().isValid ? page.body : Page.login.body
        self.lastView = page.title
        self.isMenu = Menu(title: page.title)
        self.isSubMenu = isMenu?.submenu
    }
    
    func change(menu: Menu) {
        self.isMenu = menu
        
        if let page = Page(title: menu.title) {
            self.isPage = page
            self.isView = Authentication().isValid ? page.body : Page.login.body
            self.lastView = page.title
            self.isMenu = Menu(title: page.title)
            self.isSubMenu = isMenu?.submenu
        }
    }
}
