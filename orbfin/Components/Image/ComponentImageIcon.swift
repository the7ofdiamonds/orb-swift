//
//  ComponentImageIcon.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/10/24.
//

import SwiftUI

struct ComponentImageIcon: View {
    var url: String
    
    var body: some View {
        if let imageURL = URL(string: url) {
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(Styling.cornerRadius)
                        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
                        .frame(maxWidth: Styling.sizeWidthPhoto(), idealHeight: Styling.sizeHeightPhoto())
                    
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    ComponentImageIcon(url: "https://plaid-merchant-logos.plaid.com/walmart_1100.png")
}
