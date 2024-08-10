//
//  ViewManagePersonal.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/10/24.
//

import SwiftUI

struct ViewManagePersonalSummary: View {
    @EnvironmentObject private var vm: ViewModelManagePersonal

    var body: some View {
        Text("DTI: \(vm.debtToIncome)")
        Text("Networth: \(vm.networth)")    }
}

#Preview {
    ViewManagePersonalSummary()
}
