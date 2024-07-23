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
    
    @AppStorage("lastView") var lastView: String = "Login"
    
    @Published var isViewType: ViewType?
    @Published var isPage: Page? = .home
    @Published var isMenu: Menu?
    @Published var isView: AnyView?
    @Published var path: [String] = []
    
    init() {
        self.authentication = authentication
        self.isView = Page.manage.body
//        if let savedView = lastView,
//           let page = Page(label: savedView) {
//            self.isView = authentication.checkAuthentication() ? AnyView(page.body) : AnyView(Page.login.body)
//        }
    }
    
    func change(page: Page) {
        self.isPage = page
        self.isView = page.body
        self.lastView = page.label
        self.path.append(page.label)
    }
    
    func change(menu: Menu) {
        self.isMenu = menu
        
        if let page = Page(title: menu.title) {
            self.isView = page.body
            self.lastView = page.label
            self.path.append(page.label)
        }
    }
}
