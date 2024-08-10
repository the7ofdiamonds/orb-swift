//
//  ViewManageBusinessTransactions.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManageTransactions: View {
    @StateObject private var vm = ViewModelManageBusinessTransactions()

    var body: some View {
//        ComponentCard {
            Table(vm.transactions) {
                TableColumn("Date", value: \.date)
                TableColumn("Merchant") { transaction in
                    Text(transaction.merchantName ?? "Unknown")
                }
                TableColumn("Category") { transaction in
                    Text(transaction.category.joined(separator: ", "))
                }
                TableColumn("Amount") { transaction in
                    Text(Format.formatCurrency(Double(transaction.amount), currency: transaction.currencyCode))
                }
            }.padding()
//        }
    }
}


#Preview {
    ViewManageTransactions()
}
