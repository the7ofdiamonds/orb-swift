//
//  ViewManageBusinessSummary.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/10/24.
//

import SwiftUI

struct ViewManageBusinessSummary: View {
    @EnvironmentObject private var vm: ViewModelManageBusiness
    
    var body: some View {
        Text("DTE: \(vm.debtToEquity)")
        Text("Owners Equity: \(vm.ownersEquity)")
    }
}

#Preview {
    ViewManageBusinessSummary()
}
