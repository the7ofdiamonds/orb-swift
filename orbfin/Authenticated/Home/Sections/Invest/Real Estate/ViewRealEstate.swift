//
//  ViewRealEstate.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewRealEstate: View {
    var body: some View {
        ComponentCardFixed {
            VStack(spacing: 30){
                ComponentButtonHNav(page: .commercial)
                
                ComponentDivider()
                
                ComponentButtonHNav(page: .residential)
            }
        }
        
    }
}

#Preview {
    ViewRealEstate()
}
