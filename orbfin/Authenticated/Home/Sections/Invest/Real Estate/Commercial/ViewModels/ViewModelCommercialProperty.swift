//
//  ViewModelCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import Foundation
import MapKit

@MainActor
class ViewModelCommercialProperty: ObservableObject {
    @Published var property: Commercial?
    
    init(property: Commercial? = nil) {
        self.property = property
    }
    
    func change(property: Commercial) {
        self.property = property
    }
}
