//
//  ContentMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import Foundation
import SwiftUI

enum ContentMenu: CaseIterable {
    case personal
    case personalincome
    case personalexpenses
    case personalassets
    case personalliabilities
    case personalrevenue
    
    case business
    case businessincome
    case businessexpenses
    case businessassets
    case businessliabilities
    case businessrevenue
}

extension ContentMenu: ProtocolViewType {
    var title: String {
        return ""
    }
    
    var label: String {
        switch self {
        case .personal:
            return "Personal"
        case .personalincome:
            return "Income"
        case .personalexpenses:
            return "Expenses"
        case .personalassets:
            return "Assets"
        case .personalliabilities:
            return "Liabilities"
        case .personalrevenue:
            return "Revenue"
            
        case .business:
            return "Business"
        case .businessincome:
            return "Income"
        case .businessexpenses:
            return "Expenses"
        case .businessassets:
            return "Assets"
        case .businessliabilities:
            return "Liabilities"
        case .businessrevenue:
            return "Revenue"
        }
    }
    
    var icon: String {
        switch self {
        case .personal:
            return "Personal"
        case .personalincome:
            return "Income"
        case .personalexpenses:
            return "Expenses"
        case .personalassets:
            return "Assets"
        case .personalliabilities:
            return "Liabilities"
        case .personalrevenue:
            return "Revenue"
            
        case .business:
            return "Business"
        case .businessincome:
            return "Income"
        case .businessexpenses:
            return "Expenses"
        case .businessassets:
            return "Assets"
        case .businessliabilities:
            return "Liabilities"
        case .businessrevenue:
            return "Revenue"
        }
    }
    
    var parent: ViewType {
        switch self {
        case .personal:
                .page(.manage)
        default:
            .menu(.home)
        }
    }
    
    var submenu: [ViewType] {
        switch self {
        case .personal:
            return [
                .contentMenu(.personalincome),
                .contentMenu(.personalexpenses),
                .contentMenu(.personalassets),
                .contentMenu(.personalliabilities)
            ]
        case .business:
            return [
                .contentMenu(.businessincome),
                .contentMenu(.businessexpenses),
                .contentMenu(.businessassets),
                .contentMenu(.businessliabilities)
            ]
        default:
                return[.page(.blank)]
        }
    }
}

extension ContentMenu {
    @ViewBuilder
    var body: any View {
        switch self {
        case .personal:
            ViewManagePersonal()
        case .personalincome:
            ViewManagePersonalIncome()
        case .personalexpenses:
            ViewManagePersonalExpenses()
        case .personalassets:
            ViewManagePersonalLiabilities()
        case .personalliabilities:
            ViewManagePersonalLiabilities()
        case .personalrevenue:
            ViewManagePersonalRevenue()
            
        case .business:
            ViewManageBusiness()
        case .businessincome:
            ViewManageBusinessIncome()
        case .businessexpenses:
            ViewManageBusinessExpenses()
        case .businessassets:
            ViewManageBusinessLiabilities()
        case .businessliabilities:
            ViewManageBusinessLiabilities()
        case .businessrevenue:
            ViewManageBusinessRevenue()
        }
    }
}

