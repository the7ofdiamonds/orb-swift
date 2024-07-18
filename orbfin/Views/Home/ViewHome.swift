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
    
    @StateObject private var navigation = Navigation.instance
    
    @StateObject private var vm: ViewModelHome

    @State private var isLoggedIn: Bool?
    @State private var selectedMenu: Menu? = nil
    @State private var selectedContentMenu: ViewType? = nil
    @State private var selectedDetailView: (any View)? = nil
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelHome())
    }
    
    var body: some View {
//        NavigationStack() {
//            Page.body
//        }
        
        NavigationSplitView {
            List {
                ForEach(Menu.allCases, id: \.label) { menu in
                    Button(action: {
                        selectedMenu = menu
                    }, label: {
                        Text(menu.label)
                    })
                }
            }
        } content: {
            if let selectedMenu {
                List {
                    ForEach(selectedMenu.submenu, id: \.label) { submenu in
                        Button(action: {
                            selectedContentMenu = submenu
                        }, label: {
                            Text(submenu.label)
                        })
                    }
                }
            }
        } detail: {
            if let selectedContentMenu {
                selectedContentMenu.body
            } else if let selectedMenu {
                selectedMenu.body
            }
        }

    }
}


#Preview {
    ViewHome()
}
