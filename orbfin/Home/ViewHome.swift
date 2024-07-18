//
//  ViewHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI
import MapKit

struct ViewHome: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation
    
    @StateObject private var vm: ViewModelHome
    
    @State private var isLoggedIn: Bool?
    @State private var selectedMenu: Menu? = nil
    @State private var selectedContentMenu: ViewType? = nil
    @State private var selectedDetailView: Page? = nil
    
    var content: AnyView? = nil
    
    init(@ViewBuilder content: () -> (AnyView)? = { nil }) {
        _vm = StateObject(wrappedValue: ViewModelHome())

            self.content = content()
    }
    
    @ViewBuilder var body: some View {
        
        ZStack {
            ComponentMap()
            content
        }
    }
}
    

#Preview {
    ViewHome {
        AnyView(ViewLogin())
    }
}
