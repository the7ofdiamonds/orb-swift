//
//  ViewManage.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManage: View {
    @StateObject private var navigation = Navigation.instance
    
    var body: some View {
        ComponentCard {
            Text(Menu.manage.label)
                .font(.headline)
                .fontWeight(.bold)
            
            HStack{
                ComponentButtonHNav(viewType: .page(.personal))
                ComponentButtonHNav(viewType: .page(.business))
            }
            
            Spacer()
            
            HStack {
                ComponentButtonBar(viewType: .page(.settings))
                ComponentButtonBar(viewType: .page(.forgot))
                ComponentButtonBar(viewType: .page(.logout))
            }
        }
    }
}

#Preview {
    ViewManage()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
