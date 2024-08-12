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
    
    init() {
        var transactionsRequest = PreviewManageBusiness.loadTransactions()
        self.currency = transactionsRequest.currencyCode
        
        updateMapLocations(transactions: transactionsRequest.transactions ?? [])
    }
    
    func updateMapLocations(transactions: [Transaction]) {
        var updatedTransactions = [Transaction]()
        
        for transaction in transactions {
            var updatedTransaction = transaction

            if let lat = transaction.location?.lat,
               let lon = transaction.location?.lon {
                let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                                
                updatedTransaction.mapLocation = MapLocation(label: transaction.name, coordinates: coordinates, icon: nil, logo: transaction.logo)
            }
            
            updatedTransactions.append(updatedTransaction)
        }
        
        self.transactions = updatedTransactions
    }
}
