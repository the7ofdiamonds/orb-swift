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
        ComponentCard {
            VStack(alignment: .center) {
                Grid(verticalSpacing: 20) {
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.income), value: "\(income)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.revenue), value: "\(revenue)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.expenses), value: "\(expenses)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.equity), value: "\(equity)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.assets), value: "\(assets)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.liabilities), value: "\(liabilities)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.contra), value: "\(contra)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.tax), value: "\(tax)")
                    }
                }
                
                VStack {
                    ComponentButtonBar(viewType: .page(.businesstransactions))
                    //                    Transactions table
                }
            }
        }
        .onAppear {
            updateFormattedValues()
        }
        //        .onChange(of: vm) { _ in
        //            updateFormattedValues()
        //        }
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
