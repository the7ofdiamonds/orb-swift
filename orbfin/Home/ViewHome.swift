//
//  ViewHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI
import MapKit

struct ViewHome: View {
    var content: AnyView? = nil
    
    init(@ViewBuilder content: () -> (AnyView)? = { nil }) {
            self.content = content()
    }
    
    @ViewBuilder var body: some View {
        
        ZStack {
            ComponentMap()
            content
        }        
    }
}
    

#Preview {
    ViewHome {
        AnyView(ViewManagePersonal())
    }
    .environmentObject(Authentication())
    .environmentObject(Navigation())
}
