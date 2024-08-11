//
//  ViewManageBusinessTransactions.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManageTransactions: View {
    @EnvironmentObject var vmModal: ViewModelModal
    @EnvironmentObject var vmBusiness: ViewModelManageBusinessTransactions
    @EnvironmentObject var vmPersonal: ViewModelManagePersonalTransactions
    
    @State private var startingBalance: Double = 1000.0
    @State private var showDetails: Bool = false
    @State private var selectedTransaction: Transaction?

    var page: Page
    
    var transactions: [Transaction] {
        switch page {
        case .businesstransactions:
            return vmBusiness.transactions
        case .personaltransactions:
            return vmPersonal.transactions
        default:
            return []
        }
    }
    var currency: String {
        switch page {
        case .businesstransactions:
            return vmBusiness.currency
        case .personaltransactions:
            return vmPersonal.currency
        default:
            return "USD"
        }
    }
    var total: String {
        let sum = transactions.reduce(0) { $0 + $1.amount }
        return Format.formatCurrency(sum, currency: currency)
    }
    
    var body: some View {
        if vmModal.show {
            ZStack {
                ComponentCard {
                    Text("Total: \(total)")
                }
                
                ComponentCard {
                    Table(transactions) {
                        TableColumn("#", value: \.id)
                        TableColumn("Date", value: \.date)
                        TableColumn("Name") { transaction in
                            if let logo = transaction.logo {
                                Button {
                                    selectedTransaction = transaction
                                    
                                    if selectedTransaction != nil {
                                        vmModal.showModal = true
                                    }
                                } label: {
                                    HStack {
                                        ComponentImageIcon(url: logo)
                                            .frame(width: 30, height: 30)
                                        Text(transaction.name)
                                    }
                                }
                            } else {
                                Button {
                                    selectedTransaction = transaction
                                    
                                    if selectedTransaction != nil {
                                        showDetails = true
                                    }
                                } label: {
                                    HStack {
                                        Text(transaction.name)
                                    }
                                }
                            }
                        }
                        TableColumn("Debit") { transaction in
                            if transaction.type == "debit" {
                                Text(Format.formatCurrency(Double(transaction.amount), currency: transaction.currencyCode))
                            }
                        }
                        TableColumn("Credit") { transaction in
                            if transaction.type == "credit" {
                                Text(Format.formatCurrency(Double(transaction.amount), currency: transaction.currencyCode))
                            }
                        }
                        TableColumn("Balance") { transaction in
                            let balance = calculateBalance(for: transaction)
                            Text(Format.formatCurrency(balance, currency: transaction.currencyCode))
                        }
                    }
                    .padding()
                }
                
                if vmModal.showModal,
                   let transaction = selectedTransaction {
                    ViewModal {
                        ViewManageTransactionDetails(transaction: transaction)
                    }
                }
            }
        }
    }
    
    private func calculateBalance(for transaction: Transaction) -> Double {
        var balance = startingBalance
        for t in transactions {
            if t.id == transaction.id {
                break
            }
            balance += (t.type == "credit" ? t.amount : -t.amount)
        }
        return balance + (transaction.type == "credit" ? transaction.amount : -transaction.amount)
    }
}


#Preview {
    ViewManageTransactions(page: .personaltransactions)
        .environmentObject(ViewModelModal())
        .environmentObject(ViewModelManagePersonalTransactions())
        .environmentObject(ViewModelManageBusinessTransactions())
}
