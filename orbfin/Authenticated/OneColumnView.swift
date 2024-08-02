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
    @EnvironmentObject var vmCommercial: ViewModelCommercial

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

struct OneColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Group {    
            OneColumnView()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Authentication())
                .environmentObject(Navigation())
                .environmentObject(ViewModelCommercial())
        }
    }
}
