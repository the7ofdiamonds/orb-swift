//
//  ViewModelManagePersonalTransactions.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import Foundation
import MapKit

@MainActor
class ViewModelManagePersonalTransactions: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var currency: String = ""
    
    var locations: [MapLocation] = []
    
    private static let instance = ViewModelManagePersonalTransactions()
    
    init() {
        let transactionsRequest = PreviewManagePersonal.loadTransactions()
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
