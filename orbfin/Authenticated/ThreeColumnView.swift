//
//  ThreeColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct ThreeColumnView: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    
    @ViewBuilder var body: some View {
        NavigationSplitView {
            ComponentButtonHome()
                .environmentObject(navigation)

            ViewHomeMenu()
                .environmentObject(navigation)
        } content: {
            ViewHomeContentMenu()
                .environmentObject(navigation)
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


struct ThreeColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Group {         
            ThreeColumnView()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air (10th Generation)"))
                .previewInterfaceOrientation(.landscapeLeft)
                .environmentObject(Navigation())
                .environmentObject(ViewModelCommercial())
        }
    }
}
