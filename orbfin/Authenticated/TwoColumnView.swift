//
//  TwoColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct TwoColumnView: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    
    var body: some View {
        NavigationSplitView {
            ComponentButtonHome()
                .environmentObject(navigation)
            
            ViewHomeContentMenu()
                .environmentObject(navigation)
            
            Section {
                List {
                    ForEach(Menu.home.submenu, id: \.id) { menu in
                        Button(action: {
                            navigation.change(menu: menu)
                        }, label: {
                            Text(menu.label)
                        })
                        .font(.headline)
                        .fontWeight(.bold)
                    }
                }
            }
        } detail: {
            ViewAuthenticated()
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
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
                    }
                })
            
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            ComponentBar()
        }
    }
}

struct TwoColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Group {        
            TwoColumnView()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelCommercial())
        }
    }
}
