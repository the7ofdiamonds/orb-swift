//
//  ComponentCardHighlights.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI

struct ComponentCardHighlights: View {
    var highlights: [String]
    
    var body: some View {
        ComponentCard(title: "Highlights") {
            VStack(alignment: .leading) {
                ForEach(highlights, id: \.self) { highlight in
                    Text("• \(highlight)")
                        .font(Styling.font(component: .card))
                }
            }
        }
    }
}

#Preview {
    ComponentCardHighlights(highlights: PreviewCommercialProperty.loadProperty().highlights ?? [])
}
