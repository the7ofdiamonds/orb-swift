//
//  ViewManagePersonal.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewManagePersonal: View {
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        ScrollView {
            
            ComponentCard {
                VStack(alignment: .center) {
                    Grid(verticalSpacing: 20) {
                        GridRow {
                            ComponentButtonDoubleH(page: .personalincome, value: "$100,000.00")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .personalexpenses, value: "-$100,000.00")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .personalassets, value: "-$100,000.00")
                        }
                        
                        GridRow {
                            ComponentButtonDoubleH(page: .personalliabilities, value: "-$100,000.00")
                        }
                    }
                    
                    VStack {
                        ComponentButtonBar(page: .personaltransactions)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ViewManagePersonal()
        .environmentObject(Authentication())
        .environmentObject(Navigation())
}
