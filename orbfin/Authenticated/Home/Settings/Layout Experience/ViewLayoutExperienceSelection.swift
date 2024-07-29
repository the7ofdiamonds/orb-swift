//
//  LayoutExperienceSelectionView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/20/24.
//

import SwiftUI

struct ViewLayoutExperienceSelection: View {
    @State private var isHovering = false
    @Binding var selectedItem: String?
    
    let item: LayoutExperienceSetting
    
    var body: some View {
        VStack {
            Image(systemName: item.imageName)
                .font(.largeTitle)
                .foregroundColor(selectedItem == item.title ? Styling.color(.Card) : Styling.color(.CardFont))
            VStack {
                Text(item.title)
                    .bold()
                    .foregroundStyle(selectedItem == item.title ? Styling.color(.Card) : Styling.color(.CardFont))
                Text(item.description)
                    .lineLimit(3, reservesSpace: true)
                    .font(.callout)
                    .foregroundStyle(selectedItem == item.title ? Styling.color(.Card) : Styling.color(.CardFont))
            }
            .padding(.top, 16)
        }
        .padding(24)
        .background {
            RoundedRectangle(cornerRadius: 12,
                             style: .continuous)
            .fill(selectedItem == item.title ? AnyShapeStyle(Styling.color(.CardFont)) : AnyShapeStyle(.background))
            .shadow(radius: selectedItem == item.title ? 4 : 0)
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(isHovering ? Color.accentColor : .clear)
        }
        .scaleEffect(isHovering ? 1.02 : 1)
        .onHover { isHovering in
            withAnimation {
                self.isHovering = isHovering
            }
        }
    }
    
    func shapeStyle<S: ShapeStyle>(_ style: S) -> some ShapeStyle {
        if selectedItem == item.title {
            return AnyShapeStyle(.background)
        } else {
            return AnyShapeStyle(style)
        }
    }
}
