//
//  ViewManage.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManage: View {
    
    var body: some View {
        ComponentCard {
            Text(Menu.manage.label)
                .font(.headline)
                .fontWeight(.bold)
            
            HStack{
                ComponentButtonHNav(page: .personal)
                ComponentButtonHNav(page: .business)
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
