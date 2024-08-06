//
//  ViewModelResidentialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import Foundation

@MainActor
class ViewModelResidentialProperty: ObservableObject {
    @Published var property: Residential?

    init(property: Residential? = nil) {
        if property != nil {
            self.property = property
            Task {
                await fetchCoordinatesForProperty()
            }
        } else {
            self.property = PreviewResidentialProperty.loadProperty()
        }
    }
    
    private func fetchCoordinatesForProperty() async {
        if property != nil, let address = property?.address?.toString() {
            property?.coordinates = try? await LocationManager.instance.getCoordinates(address: address)
        }
    }
}
