//
//  ViewModelManageBusinessTransactions.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/19/24.
//

import Foundation
import MapKit

@MainActor
class ViewModelManageBusinessTransactions: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var currency: String = "USD"

    var locations: [MapLocation] = []
    
    init() {
        let transactionsRequest = PreviewManageBusiness.loadTransactions()
        self.currency = transactionsRequest.currencyCode

        if let transactions = transactionsRequest.transactions {
            self.transactions = transactions
        }
        
        getLocations(transactions: self.transactions)
    }
    
    func getLocations(transactions: [Transaction]) {
        var locations = [MapLocation]()
        
        for transaction in transactions {
            if let location = transaction.location,
               let lat = location.lat,
               let lon = location.lon {
                let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                locations.append(MapLocation(label: transaction.name, coordinates: coordinates, icon: nil, logo: transaction.logo))
            }
        }
        
        self.locations = locations
        }
}
