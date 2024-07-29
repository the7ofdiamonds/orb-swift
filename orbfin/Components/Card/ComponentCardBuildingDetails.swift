//
//  ComponentCardBuildingDetails.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI

struct ComponentCardBuildingDetails: View {
    var buildingDetails: BuildingDetails
    
    var body: some View {
        ComponentCard(title: "Building Details") {
            if let propertyType = buildingDetails.propertyType {
                Text("Type \(propertyType)")
            }
            if let propertySubType = buildingDetails.propertySubType {
                Text("Sub Type \(propertySubType)")
            }
            if let additionalSubTypes = buildingDetails.additionalSubTypes {
                Group {
                    Text("Additional Sub Types")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                    ForEach(additionalSubTypes, id: \.self){ subtype in
                        Text("\(subtype)")
                    }
                }
            }
            if let stories = buildingDetails.stories {
                Text("Stories \(stories)")
            }
            if let yearbuilt = buildingDetails.yearbuilt {
                Text("Year Built \(yearbuilt)")
            }
            if let sprinklers = buildingDetails.sprinklers {
                Text("Sprinklers \(sprinklers)")
            }
            if let parkingSpaces = buildingDetails.parkingSpaces {
                Text("Parking Spaces \(parkingSpaces)")
            }
        }
    }
}

#Preview {
    ComponentCardBuildingDetails(buildingDetails: PreviewCommercialProperty.loadProperty().buildingDetails ?? BuildingDetails())
}
