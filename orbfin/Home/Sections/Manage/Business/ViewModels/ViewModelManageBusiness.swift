//
//  ViewModelManageBusiness.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/17/24.
//

import Foundation

@MainActor
class ViewModelManageBusiness: ObservableObject {
    @Published var currency: String?
    @Published var revenue: Float = 0
    @Published var expenses: Float = 0
    @Published var assets: Float = 0
    @Published var liabilities: Float = 0
    @Published var transactions: [Transaction] = []
    @Published var profit: Float = 0
    @Published var equity: Float = 0
        
    init() {
        self.revenue = 100000.00
        self.expenses = -100000.00
        self.profit = self.revenue + self.expenses
        self.assets = 100000.00
        self.liabilities = -100000.00
        self.equity = self.assets + self.liabilities
//        self.transactions = 100000.00
    }
}
