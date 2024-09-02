//
//  ViewCommercialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI

struct ViewCommercialProperty: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelRealEstate
    
    @StateObject private var location: LocationManager = LocationManager.instance
    
    @State var property: RealEstateProperty?
    
    let serviceType: String = ServiceType.realestatesales.rawValue

    var body: some View {
        ScrollView {
            if let property = property,
               vmModal.show {
                VStack(spacing: 25) {
                    if let images = property.images {
                        ComponentCardImages(images: images)
                    }
                    
                    if let address = property.address {
                        ComponentCardLocation(address: address, action: {
                            vmModal.show = false
                        })
                    }
                    
                    if let highlights = property.highlights {
                        ComponentCardHighlights(highlights: highlights)
                    }
                    
                    if let overview = property.overview {
                        ComponentCardOverview(overview: overview)
                    }
                    
                    if let salesDetails = property.saleDetails {
                        ComponentCardSaleDetails(saleDetails: salesDetails)
                    }
                    
                    if let buildingDetails = property.buildingDetails {
                        ComponentCardBuildingDetails(buildingDetails: buildingDetails)
                    }
                    
                    if let landDetails = property.landDetails {
                        ComponentCardLandDetails(landDetails: landDetails)
                    }
                    
                    if let providerID = property.providerID {
                        ComponentCardContact {_ in
                            Task {
                                try await vm.request(request: RequestProperty(
                                    id: property.id,
                                    apn: property.apnParcelID,
                                    propertyClass: property.propertyClass,
                                    location: Location(
                                        address: property.address,
                                        coordinates: Coordinates(
                                            latitude: property.coordinates?.latitude ?? 0.0,
                                            longitude: property.coordinates?.longitude ?? 0.0)),
                                    saleDetails: property.saleDetails,
                                    buildingDetails: property.buildingDetails,
                                    landDetails: property.landDetails,
                                    providerID: providerID,
                                    date: "9/2/24",
                                    time: "12:00"))
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            if let property = property,
               let coordinates = property.coordinates {
                location.changeCamera(coordinates: coordinates)
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                if let property = property,
                   let address = property.address?.toString() {
                    HStack {
                        Spacer()
                        
                        Text(address)
                            .font(Styling.font(component: .title))
                            .kerning(Styling.kerning)
                            .padding()
                        
                        Spacer()
                    }
                    .background(Color(Styling.color(.Bar)))
                }
            }
        }
    }
}

struct ViewCommercialProperty_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCommercialProperty()
                .previewDisplayName("iPhone 15 Pro")
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelModal())
                .environmentObject(ViewModelRealEstate())
            
            ViewCommercialProperty()
                .previewDisplayName("iPad Pro")
                .previewDevice(PreviewDevice(rawValue: "iPad Air 11-inch (M2)"))
                .environmentObject(Navigation())
                .environmentObject(ViewModelModal())
                .environmentObject(ViewModelRealEstate())
        }
    }
}
