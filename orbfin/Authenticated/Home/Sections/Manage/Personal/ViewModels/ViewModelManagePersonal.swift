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
    @Published var revenue: Float = 0
    @Published var expenses: Float = 0
    @Published var income: Float = 0
    @Published var assets: Float = 0
    @Published var liabilities: Float = 0
    @Published var equity: Float = 0
    @Published var contra: Float = 0
    @Published var tax: Float = 0
    @Published var transactions: [Transaction] = []

    init() {
        self.revenue = 100000.00
        self.expenses = -100000.00
        self.income = self.revenue + self.expenses
        self.assets = 100000.00
        self.liabilities = -100000.00
        self.equity = self.assets + self.liabilities
        self.contra = 0.00
        self.tax = 0.00
//        self.transactions = 100000.00
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
