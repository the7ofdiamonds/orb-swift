//
//  ComponentCardLandDetails.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI

struct ComponentCardLandDetails: View {
    var landDetails: LandDetails
    
    var body: some View {
        ComponentCard(title: "Land Details") {
            if let landAcres = landDetails.landAcres {
                Text("Acres \(landAcres)")
            }
            if let landSqft = landDetails.landSqft {
                Text("SQFT \(landSqft)")
            }
            if let zoning = landDetails.zoning {
                Text("Zoning \(zoning)")
            }
            if let apnParcelID = landDetails.apnParcelID {
                Text("APN/Parcel ID \(apnParcelID)")
            }
        }
    }
}

#Preview {
    ComponentCardLandDetails(landDetails: PreviewCommercialProperty.loadProperty().landDetails ?? LandDetails())
}
