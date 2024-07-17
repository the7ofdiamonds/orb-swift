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
            Text(Page.manage.label)
                .font(.headline)
                .fontWeight(.bold)
            
            HStack{
                ComponentButtonHNav(page: Page.personal)
                ComponentButtonHNav(page: Page.business)
            }
            
            Spacer()
            
            HStack {
                ComponentButtonBar(page: .settings)
                ComponentButtonBar(page: .forgot)
                ComponentButtonBar(page: .logout)
            }
        }
    }
}

#Preview {
    ViewManage()
}
