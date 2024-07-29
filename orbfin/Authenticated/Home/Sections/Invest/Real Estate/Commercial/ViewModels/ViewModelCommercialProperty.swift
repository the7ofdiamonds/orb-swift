//
//  ViewModelCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import Foundation

@MainActor
class ViewModelCommercialProperty: ObservableObject {
    @Published var property: Commercial?
    
//    init(property: String? = nil) {
//        self.property = PreviewCommercialProperty.loadProperty()
//    }
    
    init(property: String? = nil) {
        self.property = PreviewCommercialProperty.loadProperty()
    }
}
