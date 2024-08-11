//
//  ViewManageTransactionDetails.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/10/24.
//

import SwiftUI
import MapKit

struct ViewManageTransactionDetails: View {
    @EnvironmentObject var vmModal: ViewModelModal
    
    @StateObject private var locationManager: LocationManager = LocationManager.instance
    
    var transaction: Transaction
    
    var location: TransactionLocation? {
        if let location = transaction.location {
            return location
        } else {
            return nil
        }
    }
    var coordinates: CLLocationCoordinate2D? {
        if let location = transaction.location,
           let latitude = location.lat,
           let longitude = location.lon {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
            return nil
        }
    }
    
    var body: some View {
        Group {
            if let logo = transaction.logo {
                ComponentImageIcon(url: logo)
                    .frame(width: 100, height: 100)
            } else {
                Text("\(transaction.name)")
            }
            
            Text("ID: \(transaction.id)")
            Text("Date: \(transaction.date)")
            Text("Merchant Name: \(transaction.description)")
            Text("Name: \(transaction.name)")
            Text("Type: \(transaction.type)")
            Text("Currency Code: \(transaction.currencyCode)")
            Text("Amount: \(transaction.amount)")
        }
        .onAppear {
            if let coordinates {
                locationManager.changeCamera(coordinates: coordinates)
            }
        }
    }
}

struct ViewManageTransactionDetails_Previews: PreviewProvider {
    static var previews: some View {
        let transactions = [
            Transaction(id: "1", type: "debit", amount: 28.34, date: "2023-09-28", currencyCode: "USD", description: "Dd Doordash Burgerkin", name: "Burger King", logo: "https://plaid-merchant-logos.plaid.com/doordash_1.png", location: TransactionLocation(address: "13425 Community Rd", city: "Poway", region: "CA", postal_code: "92064", country: "US", lat: 32.959068, lon: -117.037666, store_number: "1700"))
        ]
        ViewManageTransactionDetails(transaction: transactions[0])
    }
}
