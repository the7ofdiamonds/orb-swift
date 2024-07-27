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
        VStack(alignment: .leading,
               spacing: 24) {
            Text("Layout Configuration")
                .font(.title)
                .bold()
                        
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
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.thinMaterial)
        }
        .scenePadding()
    }
}

struct LayoutExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ViewLayoutExperience()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
