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
    
    @Published var isView: any View = Page.login.body
    
    init() {
        self.authentication = authentication
        
        if let savedView = lastView,
           let page = Page(label: savedView) {
            self.isView = authentication.checkAuthentication() ? page.body : Page.login.body
        }
    }
    
    func change(view: ViewType) {
        self.isView = view.body
//        self.lastView = viewType.rawValue
//        print(viewType.self)
    }
}
