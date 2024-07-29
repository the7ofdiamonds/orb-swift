//
//  ViewTangibleAssets.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewTangibleAssets: View {
    var body: some View {
            ComponentCard {
                VStack(spacing: 30){

                    ComponentButtonHNav(page:
                            .tangibleassetsbusiness)
                    
                    ComponentDivider()
                    
                    ComponentButtonHNav(page:
                            .tangibleassetsrealestate)
            }
        }
    }
}

#Preview {
    ViewTangibleAssets()
}
