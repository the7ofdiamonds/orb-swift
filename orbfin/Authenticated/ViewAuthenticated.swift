//
//  ViewAuthenticated.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/26/24.
//

import SwiftUI
import MapKit

struct ViewAuthenticated: View {
    @EnvironmentObject var navigation: Navigation

    @StateObject var vm = ViewModelAuthenticated()
    
    @ViewBuilder var body: some View {
        ZStack {
            ComponentMap()
            
            VStack {
                Spacer()
                
                navigation.isView
                
                Spacer()
            }
            .padding(.top, Styling.paddingEdgesTop())
            .padding(.horizontal, Styling.paddingEdgesHorizontal())
            .padding(.bottom, Styling.paddingEdgesBottom())
        }
    }
}

#Preview {
    ViewAuthenticated()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
