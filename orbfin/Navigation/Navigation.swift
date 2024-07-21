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
    
    @Published var isView: AnyView?
    
    init() {
        self.authentication = authentication

        if let savedView = lastView,
           let page = Page(label: savedView) {
            self.isView = authentication.checkAuthentication() ? AnyView(page.body) : AnyView(Page.login.body)
        }
    }
    
    func change(view: ViewType) {
        self.isView = AnyView(view.body)
        self.lastView = view.label
    }
}
