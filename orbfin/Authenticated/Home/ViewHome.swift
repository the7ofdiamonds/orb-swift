//
//  ViewHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI
import MapKit

struct ViewHome: View {
    var body: some View {
        
        ComponentCard {
            HStack {
                ComponentButtonBar(page: .manage)
                ComponentButtonBar(page: .invest)
                ComponentButtonBar(page: .services)
            }
        }
    }
}
    

#Preview {
    ViewHome()
}
