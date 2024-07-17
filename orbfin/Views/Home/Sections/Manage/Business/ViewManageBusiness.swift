//
//  ViewManageBusiness.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManageBusiness: View {
    var body: some View {
        ComponentCard {
            VStack(alignment: .center) {
                Grid(verticalSpacing: 20) {
                    GridRow {
                        ComponentButtonDoubleH(page: .revenue, value: "$100,000.00")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(page: .expenses, value: "-$100,000.00")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(page: .assets, value: "-$100,000.00")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(page: .liabilities, value: "-$100,000.00")
                    }
                }
                
                VStack {
                    ComponentButtonBar(page: .businesstransactions)
                    //                    Transactions table
                }
            }
        }
    }
}

#Preview {
    ViewManageBusiness()
}
