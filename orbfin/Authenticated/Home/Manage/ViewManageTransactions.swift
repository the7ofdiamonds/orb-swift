//
//  ViewManageBusinessTransactions.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManageTransactions: View {
    @EnvironmentObject var vmModal: ViewModelModal

    @StateObject private var vmBusiness = ViewModelManageBusinessTransactions()
    @StateObject private var vmPersonal = ViewModelManagePersonalTransactions()
    
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
        ComponentCard {
            Text("Total: \(total)")
        }
        
        ComponentCard {
            Table(transactions) {
                TableColumn("#", value: \.id)
                TableColumn("Date", value: \.date)
                TableColumn("Name") { transaction in
                    Button {
                        selectedTransaction = transaction
                        showDetails = true
                    } label: {
                        HStack {
                            ComponentImageIcon(url: transaction.logo)
                                .frame(width: 30, height: 30)
                            Text(transaction.name)
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
        .sheet(isPresented: $showDetails) {
            
            if let transaction = selectedTransaction {
                            ViewManageTransactionDetails(transaction: transaction)
                                .onAppear {
                                    print("Sheet is showing with transaction: \(transaction)")
                                }
                        } else {
                            Text("No transaction selected")
                                .onAppear {
                                    print("No transaction to show in the sheet")
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
}
