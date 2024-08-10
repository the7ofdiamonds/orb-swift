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
    @Published var revenue: Double = 0
    @Published var expenses: Double = 0
    @Published var income: Double = 0
    @Published var assets: Double = 10000
    @Published var debt: Double = 20000.0
    @Published var liabilities: Double = 5000
    @Published var equity: Double = 100000.0
    @Published var contra: Double = 0
    @Published var tax: Double = 0
    @Published var transactions: [Transaction] = []
    
//    init() {
//        self.revenue = 100000.00
//        self.expenses = -100000.00
//        self.income = self.revenue + self.expenses
//        self.assets = 100000.00
//        self.debt = 10000
//        self.liabilities = -100000.00
//        self.equity = self.assets + self.liabilities
//        self.contra = 0.00
//        self.tax = 0.00
//        self.transactions = 100000.00
//    }
    
    var ownersEquity: String {
        let OE: Double = self.assets - self.liabilities
        return Format.formatCurrency(OE, currency: currency)
    }
    var debtToEquity: String {
        if self.equity == 0 {
            return "N/A"
        } else {
            let ratio: Double = self.debt / self.equity
            return String(format: "%.2f%%", ratio * 100)
        }
    }
    
    func getManageBusinessData(page: Page) -> String {
        switch page {
        case .businessrevenue:
            return Format.formatCurrency(revenue, currency: currency)
        case .businessincome:
            return Format.formatCurrency(income, currency: currency)
        case .businessexpenses:
            return Format.formatCurrency(expenses, currency: currency)
        case .businessassets:
            return Format.formatCurrency(assets, currency: currency)
        case .businessliabilities:
            return Format.formatCurrency(liabilities, currency: currency)
        case .businesscontra:
            return Format.formatCurrency(contra, currency: currency)
        case .businesstax:
            return Format.formatCurrency(tax, currency: currency)
        default:
            return ""
        }
    }
}
