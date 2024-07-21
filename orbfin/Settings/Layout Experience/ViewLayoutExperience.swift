//
//  LayoutExperience.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/20/24.
//

import SwiftUI
import SwiftData


struct ViewLayoutExperience: View {
    @Binding var selectedLayoutExperience: LayoutExperienceSetting?
    
    var settings: Settings = Settings()
    
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
                        selectedLayoutExperience = item
                        settings.layoutExperience = item.title
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
        ViewLayoutExperience(selectedLayoutExperience: .constant(.twoColumn))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
