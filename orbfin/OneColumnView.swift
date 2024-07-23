//
//  OneColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct OneColumnView: View {
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                ComponentMap()
               
                VStack {
                    Spacer()
                    
                    AnyView(navigation.isView)
                    
                    Spacer()
                }
            }
            .navigationDestination(for: Page.self) { page in
                page.body
            }
            .toolbar(content: {
                ToolbarItemGroup(placement: .bottomBar) {
                    ComponentBar {
                        ComponentButtonBar(page: .manage)
                        ComponentButtonBar(page: .invest)
                        ComponentButtonBar(page: .services)
                    }
                }
            })
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigation) {
                    if let page = navigation.isPage {
                        let parent = page.parent
                        Button(action: {
                            navigation.change(page: parent)
                        }, label: {
                            Text(parent.label)
                                .font(.subheadline)
                        })
                    }
                }
            })

        }

    }
}

#Preview {
    OneColumnView()
        .environmentObject(Navigation())
}
