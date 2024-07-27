//
//  ViewAuthenticated.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/26/24.
//

import SwiftUI

struct ViewAuthenticated: View {
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
    ViewAuthenticated()
}
