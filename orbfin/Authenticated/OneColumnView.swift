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
            ViewAuthenticated()
        }
        .safeAreaInset(edge: .top, content: {
            if let page = navigation.isPage {
                HStack {
                    Spacer()
                    
                    Text(page.title)
                        .font(Styling.font(component: .title))
                        .kerning(Styling.kerning)
                        .padding()
                    
                    Spacer()
                }
                .background(Color(Styling.color(.Bar)))
            }
        })
        .safeAreaInset(edge: .bottom, spacing: 0) {
            VStack {
                Spacer()

                ComponentBar {
                    
                    Group {
                        ComponentButtonBar(page: .manage)
                        ComponentButtonBar(page: .invest)
                        ComponentButtonBar(page: .services)
                    }
                    .padding()
                }
                .ignoresSafeArea(.all)
            }
        }
    }
}

#Preview {
    OneColumnView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
