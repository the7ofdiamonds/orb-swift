//
//  ComponentSearchBy.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import SwiftUI

struct ComponentSearchBy: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vm: ViewModelRealEstate
    
    @StateObject private var locationManager: LocationManager = LocationManager.instance
    
    @State var properties: [RealEstateProperty]? = []
    @State var initialized: Int = 0
    
    @State private var streetAddress: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zipcode: String = ""
    @State private var county: String = ""
    @State private var price: Int = 0
    @State private var priceSF: Int = 0
    @State private var capRate: Double = 0.0
    @State private var leased: Double = 0.0
    @State private var tenancy: String = ""
    @State private var saleType: String = ""
    @State private var propertyType: String = ""
    @State private var propertySubType: String = ""
    @State private var additionalSubTypes: String = ""
    @State private var stories: Int = 0
    @State private var yearbuilt: Int = 0000
    @State private var sprinklers: String = ""
    @State private var parkingSpaces: Int = 0
    @State private var totalBldgSize: Double = 0.0
    @State private var landAcres: Double = 0.0
    @State private var landSqft: Double = 0.0
    @State private var zoning: String = ""
    
    private var coordinates: Coordinates? {
        if let coords = locationManager.location {
            let latitude = coords.latitude
            let longitude = coords.longitude
            return Coordinates(latitude: Double(latitude), longitude: Double(longitude))
        } else {
            return nil
        }
    }
    
    private var request: RequestProperties {
        RequestProperties(
            propertyClass: PropertyClass(rawValue: propertyType),
            location: Location(address: Address(
                streetAddress: streetAddress,
                city: city,
                state: state,
                zipcode: zipcode,
                county: county
            ), coordinates: coordinates),
            saleDetails: SaleDetails(
                price: price,
                priceSF: priceSF,
                capRate: capRate,
                leased: leased,
                tenancy: tenancy,
                saleType: saleType),
            buildingDetails: BuildingDetails(
                propertyType: propertyType,
                propertySubType: propertySubType,
                stories: stories,
                yearbuilt: yearbuilt,
                sprinklers: sprinklers,
                parkingSpaces: parkingSpaces,
                totalBldgSize: totalBldgSize),
            LandDetails: LandDetails(
                landAcres: landAcres,
                landSqft: landSqft,
                zoning: zoning)
        )
    }
    
    var body: some View {
        VStack(spacing: 30) {
            ComponentCardFixed {
                HStack(spacing: 20) {
                    VStack {
                        Group {
                            HStack {
                                Text("Street Address")
                                TextField("Street Address", text: $streetAddress)
                            }
                            
                            HStack {
                                Text("City")
                                TextField("City", text: $city)
                            }
                            
                            HStack {
                                Text("State")
                                TextField("State", text: $state)
                            }
                            
                            HStack {
                                Text("County")
                                TextField("Zipcode", text: $zipcode)
                            }
                            
                            HStack {
                                Text("County")
                                TextField("County", text: $county)
                            }
                            
                            ComponentDivider()
                            
                            HStack {
                                Text("Price")
                                TextField("Price", value: $price, formatter: NumberFormatter())
                            }
                            
                            HStack {
                                Text("Price per SQFT")
                                TextField("Price SF", value: $priceSF, formatter: NumberFormatter())
                            }
                            
                            HStack {
                                Text("Cap Rate")
                                TextField("Cap Rate", value: $capRate, formatter: NumberFormatter())
                            }
                            
                            ComponentDivider()
                            
                            HStack {
                                Text("Tenancy")
                                TextField("tenancy", text: $tenancy)
                            }
                            
                            HStack {
                                Text("Sale Type")
                                TextField("Sale Type", text: $saleType)
                            }
                            
                            ComponentDivider()
                            
                            HStack {
                                Text("Property Type")
                                
                                if navigation.isPage == .commercial {
                                    Text("Commercial Property")
                                        .onAppear {
                                            propertyType = "commercial"
                                        }
                                } else if navigation.isPage == .residential {
                                    Text("Residential Property")
                                        .onAppear {
                                            propertyType = "residential"
                                        }
                                } else {
                                    TextField("propertyType", text: $propertyType)
                                }
                            }
                            
                            HStack {
                                Text("Property Sub Type")
                                TextField("propertySubType", text: $propertySubType)
                            }
                            
                            HStack {
                                Text("Stories")
                                TextField("stories", value: $stories, formatter: NumberFormatter())
                            }
                            
                            HStack {
                                Text("Year Built")
                                TextField("yearbuilt", value: $yearbuilt, formatter: NumberFormatter())
                            }
                            
                            HStack {
                                Text("Sprinklers")
                                TextField("sprinklers", text: $sprinklers)
                            }
                            
                            HStack {
                                Text("Parking Spaces")
                                TextField("parkingSpaces", value: $parkingSpaces, formatter: NumberFormatter())
                            }
                            
                            HStack {
                                Text("Total Bldg Size")
                                TextField("totalBldgSize", value: $totalBldgSize, formatter: NumberFormatter())
                            }
                            
                            HStack {
                                Text("Land Acres")
                                TextField("landAcres", value: $landAcres, formatter: NumberFormatter())
                            }
                            
                            HStack {
                                Text("Land SQFT")
                                TextField("Land SQFT", value: $landSqft, formatter: NumberFormatter())
                            }
                            
                            HStack {
                                Text("Zoning")
                                TextField("Zoning", text: $zoning)
                            }
                        }
                        .padding(5)
                        .frame(width: 400)

                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 5)
                    
                    Button {
                        Task {
                            try await vm.getProperties(request: request)
                        }
                        
                        initialized += 1
                    } label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }
                    .fontWeight(.bold)
                    .kerning(Styling.kerning)
                    .padding()
                    .background(Styling.color(.Button))
                    .foregroundColor(Styling.color(.ButtonFont))
                    .cornerRadius(Styling.cornerRadius)
                    .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
                    
                }
            }

            ComponentSearchResults(initialized: initialized)
        }
    }
}

#Preview {
    ComponentSearchBy()
        .environmentObject(Navigation())
        .environmentObject(ViewModelModal())
        .environmentObject(ViewModelRealEstate())
}
