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
                        ForEach(Page.business.submenu) { menu in
                            GridRow {
                                ComponentButtonDoubleH(page: menu, value: vm.getManageBusinessData(page: menu))
                            }
                        }
                    }
                    
                    ComponentDivider()
                    
                    ComponentButtonBar(page: .businesstransactions)
                }
            }
        }
    }
}

#Preview {
    ViewManageBusiness()
        .environmentObject(ViewModelManageBusiness())
}
