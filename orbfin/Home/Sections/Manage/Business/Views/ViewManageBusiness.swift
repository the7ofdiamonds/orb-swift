//
//  ViewManageBusiness.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManageBusiness: View {
    @StateObject private var vm: ViewModelManageBusiness
    
    init() {
        _vm = StateObject(wrappedValue: ViewModelManageBusiness())
    }
    
    var body: some View {
        ComponentCard {
            VStack(alignment: .center) {
                Grid(verticalSpacing: 20) {
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.revenue), value: "\(vm.profit)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.revenue), value: "\(vm.revenue)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.expenses), value: "\(vm.expenses)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.assets), value: "\(vm.assets)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.liabilities), value: "\(vm.liabilities)")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.revenue), value: "\(vm.equity)")
                    }
                }
                
                VStack {
                    ComponentButtonBar(viewType: .page(.businesstransactions))
                    //                    Transactions table
                }
            }
        }
    }
}

#Preview {
    ViewManageBusiness()
}
