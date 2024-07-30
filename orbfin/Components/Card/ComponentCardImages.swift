//
//  ComponentCardImages.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/30/24.
//

import SwiftUI

struct ComponentCardImages: View {
    var images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { url in
                if let imageURL = URL(string: url) {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(Styling.cornerRadius)
                                .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)               
                                .padding()

                        
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: Styling.sizeHeight(component: .card))
    }
}

#Preview {
    ComponentCardImages(images: PreviewCommercialProperty.loadProperty().images ?? [])
}
