//
//  ViewModelManagePersonal.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import Foundation

@MainActor
class ViewModelManagePersonal: ObservableObject {
    @Published var currency: String?
    @Published var revenue: Double = 0
    @Published var expenses: Double = 0
    @Published var income: Double = 100000
    @Published var assets: Double = 50000
    @Published var debt: Double = 20000
    @Published var liabilities: Double = 0
    @Published var contra: Double = 0
    @Published var tax: Double = 0
    @Published var transactions: [Transaction] = []

//    init() {
//        self.revenue = 100000.00
//        self.expenses = -100000.00
//        self.income = self.revenue + self.expenses
//        self.assets = 100000.00
//        self.liabilities = -100000.00
//        self.equity = self.assets + self.liabilities
//        self.contra = 0.00
//        self.tax = 0.00
//        self.transactions = 100000.00
//    }
  
    var networth: String {
        let net: Double = self.assets - self.liabilities
        return Format.formatCurrency(net, currency: currency)
    }
    var debtToIncome: String {
        if self.income == 0 {
            return "N/A"
        } else {
            let ratio: Double = self.debt / self.income
            return String(format: "%.2f%%", ratio * 100)
        }
    }
    
    func getManagePersonalData(page: Page) -> String {
        switch page {
        case .personalrevenue:
            return Format.formatCurrency(revenue, currency: currency)
        case .personalincome:
            return Format.formatCurrency(income, currency: currency)
        case .personalexpenses:
            return Format.formatCurrency(expenses, currency: currency)
        case .personalassets:
            return Format.formatCurrency(assets, currency: currency)
        case .personalliabilities:
            return Format.formatCurrency(liabilities, currency: currency)
        case .personalcontra:
            return Format.formatCurrency(contra, currency: currency)
        case .personaltax:
            return Format.formatCurrency(tax, currency: currency)
        default:
            return ""
        }
    }
}
