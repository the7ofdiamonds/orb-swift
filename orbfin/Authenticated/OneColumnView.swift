//
//  OneColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct OneColumnView: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation
    
    var isLoggedIn: Bool {
        authentication.isValid
    }
    
    var body: some View {
        NavigationStack {
            
            ViewAuthenticated {
                navigation.isView
            }
            .navigationDestination(for: Page.self) { page in
                page.body
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    if let page = navigation.isPage {
                        Text(page.title)
                            .font(Styling.font(component: .title))
                            .kerning(Styling.kerning)
                    }
                }
                
                ToolbarItem(placement: .navigation) {
                    ComponentButtonBack()
                }
            }
        }
    }
}

#Preview {
    OneColumnView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
