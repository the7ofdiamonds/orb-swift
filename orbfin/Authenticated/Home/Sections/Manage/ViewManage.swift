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
            VStack(spacing: 20, content: {
                ComponentButtonHNav(page: .personal)
                ComponentButtonHNav(page: .business)
            })
            
            ComponentDivider()
            
            HStack(spacing: 20, content: {
                ComponentButtonBar(page: .settings)
                ComponentButtonBar(page: .forgot)
                ComponentButtonBar(page: .logout)
            })
        }
    }
}

#Preview {
    ViewManage()
}
