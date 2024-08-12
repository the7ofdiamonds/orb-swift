//
//  ViewMapTransactions.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import SwiftUI
import MapKit

struct ViewMapTransactions: MapContent {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmBusiness: ViewModelManageBusinessTransactions
    @EnvironmentObject var vmPersonal: ViewModelManagePersonalTransactions
    
    @StateObject var locationManager: LocationManager = LocationManager.instance
    
    var transactions: [Transaction] {
        switch navigation.isPage {
        case .manage:
            let transactions = vmBusiness.transactions + vmPersonal.transactions
            return transactions
        case .business:
            return vmBusiness.transactions
        case .personal:
            return vmPersonal.transactions
        default:
            return []
        }
    }
    
    var body: some MapContent {
        ForEach(transactions, id: \.id) { transaction in
            let coordinate = transaction.mapLocation?.coordinates ?? CLLocationCoordinate2D()
            Annotation(transaction.name, coordinate: coordinate) {
                Group {
                    ZStack {
                        if let logo = transaction.mapLocation?.logo {
                            ComponentImageIcon(url: logo)
                                .frame(width: 70, height: 70)
                        } else {
                            Image(systemName: "mappin")
                                .font(.title)
                        }
                        
                        if vmModal.showModal {
                            ViewModal {
                                ViewManageTransactionDetails(transaction: transaction)
                            }
                        }
                    }
                }
                .onTapGesture {
                    vmModal.showModal = true
                    locationManager.changeCamera(coordinates: coordinate)
                }
            }
        }
    }
}
