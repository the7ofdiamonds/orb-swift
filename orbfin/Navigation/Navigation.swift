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
    @Published var isPage: Page?
    @Published var isView: AnyView?
    @Published var path: [String] = []
    
    init() {
        self.authentication = authentication
        self.isView = AnyView(Page.manage.body)
//        if let savedView = lastView,
//           let page = Page(label: savedView) {
//            self.isView = authentication.checkAuthentication() ? AnyView(page.body) : AnyView(Page.login.body)
//        }
    }
    
    func change(view: ViewType) {
        self.isViewType = view
        self.isPage = Page(title: view.title)
        self.isView = AnyView(view.body)
        self.lastView = view.label
        self.path.append(view.label)
        print(view.label)
    }
}
