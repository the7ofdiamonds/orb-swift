//
//  ViewManageBusiness.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

extension Page {
    var summaryPage: AnyView {
        switch self {
        case .business:
            return AnyView(ViewManageBusinessSummary())
        case .personal:
            return AnyView(ViewManagePersonalSummary())
        default:
            return AnyView(EmptyView())
        }
    }
}

struct ViewManageSection: View {
    @EnvironmentObject var vmBusinessTransactions: ViewModelManageBusinessTransactions
    @EnvironmentObject var vmPersonalTransactions: ViewModelManagePersonalTransactions
    
    @StateObject private var vmBusiness = ViewModelManageBusiness()
    @StateObject private var vmPersonal = ViewModelManagePersonal()

    var page: Page
    
    var transactionsPage: Page {
        switch self.page {
        case .business:
            return .businesstransactions
        case .personal:
            return .personaltransactions
        default:
            return .blank
        }
    }
    
    private func fetchData(subPage: Page) -> String {
        switch page {
        case .business:
            return vmBusiness.getManageBusinessData(page: subPage)
        case .personal:
            return vmPersonal.getManagePersonalData(page: subPage)
        default:
            return ""
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                ComponentCardFixed {
                    page.summaryPage
                }
                
                ComponentCardFixed {
                    VStack(alignment: .center) {
                        Grid(verticalSpacing: 12.5) {
                            ForEach(page.submenu) { menu in
                                GridRow {
                                    ComponentButtonDoubleH(page: menu, value: fetchData(subPage: menu))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ViewManageSection(page: .business)
        .environmentObject(Navigation())
        .environmentObject(ViewModelManageBusiness())
        .environmentObject(ViewModelManageBusinessTransactions())
        .environmentObject(ViewModelManagePersonal())
        .environmentObject(ViewModelManagePersonalTransactions())
}
