//
//  OneColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct OneColumnView: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmCommercialProperty: ViewModelCommercialProperty

    var body: some View {
        NavigationStack {
            ViewAuthenticated()
                .environmentObject(navigation)
                .environmentObject(vmCommercial)
                .environmentObject(vmCommercialProperty)

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
        
    }
}

struct OneColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Group {    
            OneColumnView()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelCommercial())
                .environmentObject(ViewModelCommercialProperty(property: PreviewCommercial.loadProperties()[0]))

        }
    }
}
