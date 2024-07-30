//
//  ViewAuthenticated.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/26/24.
//

import SwiftUI
import MapKit

struct ViewAuthenticated: View {
    @StateObject var vm = ViewModelAuthenticated()
    
    var content: AnyView? = nil
    
    init(@ViewBuilder content: () -> (AnyView)? = { nil }) {
            self.content = content()
    }
    
    @ViewBuilder var body: some View {
        
        ZStack {
            ComponentMap(coordinate: vm.coordinates ?? CLLocationCoordinate2D())
            
            VStack {
                Spacer()
                
                content
                
                Spacer()
                
                ComponentBar {
                    Group {
                        ComponentButtonBar(page: .manage)
                        ComponentButtonBar(page: .invest)
                        ComponentButtonBar(page: .services)
                    }
                    .padding()
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ViewAuthenticated()
}
