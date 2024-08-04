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
        if property != nil {
            self.property = property
            Task {
                await fetchCoordinatesForProperty()
            }
        } else {
            self.property = PreviewCommercialProperty.loadProperty()
        }
    }
    
    private func fetchCoordinatesForProperty() async {
        if property != nil, let address = property?.address?.toString() {
            property?.coordinates = try await LocationManager.instance.getCoordinates(by: address)
        }
    }
}
