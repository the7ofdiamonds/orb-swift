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
    
//    var content: AnyView? = nil
//    
//    init(@ViewBuilder content: () -> (AnyView)? = { nil }) {
//            self.content = content()
//    }
    
    @ViewBuilder var body: some View {
        
        ZStack {
            ComponentMap()
                .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                navigation.isView

                Spacer()
            }
        }
    }
}

#Preview {
    ViewAuthenticated()
}
