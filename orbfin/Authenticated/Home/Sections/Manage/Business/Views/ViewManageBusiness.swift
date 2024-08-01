//
//  ViewManageBusiness.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManageBusiness: View {
    @StateObject private var vm = ViewModelManageBusiness()
    
    @State private var currency: String = "USD"
    @State private var income: String = "0.00"
    @State private var revenue: String = "0.00"
    @State private var expenses: String = "0.00"
    @State private var equity: String = "0.00"
    @State private var assets: String = "0.00"
    @State private var liabilities: String = "0.00"
    @State private var contra: String = "0.00"
    @State private var tax: String = "0.00"
    
    var body: some View {
        ScrollView {
            ComponentCardFixed {
                VStack(alignment: .center) {
                    Grid(verticalSpacing: 20) {
                        GridRow {
                            ComponentButtonDoubleH(page: .businessincome, value: "\(income)")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .businessrevenue, value: "\(revenue)")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .businessexpenses, value: "\(expenses)")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .businessequity, value: "\(equity)")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .businessassets, value: "\(assets)")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .businessliabilities, value: "\(liabilities)")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .businesscontra, value: "\(contra)")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .businesstax, value: "\(tax)")
                        }
                    }
                    
                    ComponentDivider()
                    
                    ComponentButtonBar(page: .businesstransactions)
                }
            }
            .onAppear {
                updateFormattedValues()
            }
        }
    }
    
    private func updateFormattedValues() {
        self.income = Format.formatCurrency(vm.income, currency: currency)
        self.revenue = Format.formatCurrency(vm.revenue, currency: currency)
        self.expenses = Format.formatCurrency(vm.expenses, currency: currency)
        self.assets = Format.formatCurrency(vm.assets, currency: currency)
        self.liabilities = Format.formatCurrency(vm.liabilities, currency: currency)
        self.equity = Format.formatCurrency(vm.equity, currency: currency)
        self.contra = Format.formatCurrency(vm.contra, currency: currency)
        self.tax = Format.formatCurrency(vm.tax, currency: currency)
    }
}

#Preview {
    ViewManageBusiness()
}
