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
            .navigationDestination(for: ViewType.self) { viewType in
                AnyView(viewType.body)
            }
            .toolbar(content: {
                ToolbarItemGroup(placement: .bottomBar) {
                    ComponentBar {
                        ComponentButtonBar(viewType: .page(.manage))
                        ComponentButtonBar(viewType: .page(.invest))
                        ComponentButtonBar(viewType: .page(.services))
                    }
                }
            })
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigation) {
                    if let page = navigation.isPage,
                       let view = navigation.isView {
                        Button(action: {
                            navigation.change(view: page.parent)
                        }, label: {
                            Text(page.parent.label)
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
