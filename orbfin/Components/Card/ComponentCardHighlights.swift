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
        ComponentCard(title: "Highlights", maxWidth: Styling.sizeWidth(component: .card)) {
            VStack(alignment: .leading) {
                ForEach(highlights, id: \.self) { highlight in
                    Text("• \(highlight)")
                        .font(Styling.font(component: .card))
                }
            }
        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ComponentCardHighlights(highlights: PreviewCommercialProperty.loadProperty().highlights ?? [])
}
