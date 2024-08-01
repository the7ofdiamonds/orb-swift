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
        .safeAreaInset(edge: .bottom) {
            HStack(alignment: .center, spacing: 50) {
                ComponentButtonBar(page: .manage)
                ComponentButtonBar(page: .invest)
                ComponentButtonBar(page: .services)
            }
            .foregroundColor(Styling.color(.BarFont))
            .frame(maxWidth: 500)
            .padding(.top, 25)
            .padding(.horizontal, 25)
            .background(Styling.color(.Bar))

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
        
    }
}

#Preview {
    OneColumnView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
