//
//  ViewManagePersonal.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManagePersonal: View {
    var body: some View {
        ComponentCard {
            VStack(alignment: .center) {
                Grid(verticalSpacing: 20) {
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.income), value: "$100,000.00")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.expenses), value: "-$100,000.00")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.assets), value: "-$100,000.00")
                    }
                    
                    GridRow {
                        ComponentButtonDoubleH(viewType: .page(.liabilities), value: "-$100,000.00")
                    }
                }
                
                VStack {
                    ComponentButtonBar(viewType: .page(.personaltransactions))
                }
            }        }
    }
}

#Preview {
    ViewManagePersonal()
}
