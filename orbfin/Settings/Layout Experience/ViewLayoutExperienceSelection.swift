//
//  LayoutExperienceSelectionView.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/20/24.
//

import SwiftUI

struct ViewLayoutExperienceSelection: View {
    @State private var isHovering = false
    @Binding var selectedItem: LayoutExperienceSetting?
    
    let item: LayoutExperienceSetting
    
    var body: some View {
        VStack {
            Image(systemName: item.imageName)
                .font(.largeTitle)
                .foregroundStyle(shapeStyle(Color.accentColor))
            VStack {
                Text(item.title)
                    .bold()
                    .foregroundStyle(shapeStyle(Color.primary))
                Text(item.description)
                    .lineLimit(3, reservesSpace: true)
                    .font(.callout)
                    .foregroundStyle(shapeStyle(Color.secondary))
            }
            .padding(.top, 16)
        }
        .padding(24)
        .background {
            RoundedRectangle(cornerRadius: 12,
                             style: .continuous)
            .fill(selectedItem == item ? AnyShapeStyle(Color.accentColor) : AnyShapeStyle(.background))
            .shadow(radius: selectedItem == item ? 4 : 0)
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
        if selectedItem == item {
            return AnyShapeStyle(.background)
        } else {
            return AnyShapeStyle(style)
        }
    }
}

//#Preview {
//    LayoutExperienceSelectionView()
//}
