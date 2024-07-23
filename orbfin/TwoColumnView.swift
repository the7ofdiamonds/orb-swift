//
//  TwoColumnView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import SwiftUI

struct TwoColumnView: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        NavigationSplitView {
            
            ViewHomeContentMenu()
            
            ViewHomeMenu()
        } detail: {
            ViewHome {
                navigation.isView ?? Page.login.body
            }
        }
        
    }
}

#Preview {
    TwoColumnView()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
