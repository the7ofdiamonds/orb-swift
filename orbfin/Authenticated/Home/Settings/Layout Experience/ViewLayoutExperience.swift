//
//  LayoutExperience.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/20/24.
//

import SwiftUI
import SwiftData


struct ViewLayoutExperience: View {
    @AppStorage("layoutExperience") var selectedLayoutExperience: String?
    
    var columns: [GridItem] {
        [
         GridItem(.flexible(), spacing: 10),
         GridItem(.flexible(), spacing: 10)
        ]
    }
    
    var body: some View {
        ComponentCard(title: "Layout Configuration") {
                
            LazyVGrid(columns: columns) {
                ForEach(LayoutExperienceSetting.allCases) { item in
                    Button {
                        selectedLayoutExperience = item.title
                    } label: {
                        ViewLayoutExperienceSelection(selectedItem: $selectedLayoutExperience,item: item)
                    }
                }
            }
        }
    }
}

struct LayoutExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ViewLayoutExperience()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
