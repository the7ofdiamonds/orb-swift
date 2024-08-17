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
    @EnvironmentObject var vmRealEstate: ViewModelRealEstate
    @EnvironmentObject var vmCommercial: ViewModelCommercial
    @EnvironmentObject var vmResidential: ViewModelResidential

    @StateObject private var locationManager: LocationManager = LocationManager.instance
        
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

    var coordinates: Coordinates? {
        if let coords = locationManager.location {
            var latitude = coords.latitude
            var longitude = coords.longitude
            return Coordinates(latitude: Double(latitude), longitude: Double(longitude))
        } else {
            return nil
        }
    }
    
    var request: RequestProperties {
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
        ComponentCardFixed {
            HStack(spacing: 15) {
                VStack {
                    TextField("Street Address", text: $streetAddress)
                    TextField("City", text: $city)
                    TextField("State", text: $state)
                    TextField("Zipcode", text: $zipcode)
                    TextField("County", text: $county)
                    ComponentDivider()
                    TextField("Price", value: $price, formatter: NumberFormatter())
                    TextField("Price SF", value: $priceSF, formatter: NumberFormatter())
                    TextField("Cap Rate", value: $capRate, formatter: NumberFormatter())
                    ComponentDivider()
                    TextField("tenancy", text: $tenancy)
                    TextField("Sale Type", text: $saleType)
                    ComponentDivider()
                    TextField("propertyType", text: $propertyType)
                    TextField("propertySubType", text: $propertySubType)
                    TextField("stories", value: $stories, formatter: NumberFormatter())
                    TextField("yearbuilt", value: $yearbuilt, formatter: NumberFormatter())
                    TextField("sprinklers", text: $sprinklers)
                    TextField("parkingSpaces", value: $parkingSpaces, formatter: NumberFormatter())
                    TextField("totalBldgSize", value: $totalBldgSize, formatter: NumberFormatter())
                    TextField("landAcres", value: $landAcres, formatter: NumberFormatter())
                    TextField("landSqft", value: $landSqft, formatter: NumberFormatter())
                    TextField("zoning", text: $zoning)
                }
                
                Button {
                    Task {
                        switch navigation.isPage {
                        case .realestate:
                            await vmRealEstate.getProperties(request: request)
                            
                        case .commercial:
                            await vmCommercial.getProperties(request: request)
                            
                        case .residential:
                            await vmResidential.getProperties(request: request)
                            
                        default:
                            await vmRealEstate.getProperties(request: request)
                        }
                    }
                    
                    vmModal.showModal = true
                } label: {
                    HStack {
                        Image(systemName: "1.magnifyingglass")
                        Text("Search")
                    }
                }
            }
            
        }
    }
}

#Preview {
    ComponentSearchBy()
}
