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
    case business
    case income
    case expenses
    case assets
    case liabilities
    case revenue
}

extension ContentMenu: ProtocolViewType {
    
    var label: String {
        switch self {
        case .personal:
            return "Personal"
        case .business:
            return "Business"
        case .income:
            return "Income"
        case .expenses:
            return "Expenses"
        case .assets:
            return "Assets"
        case .liabilities:
            return "Liabilities"
        case .revenue:
            return "Revenue"
        }
    }
    
    var icon: String {
        switch self {
        case .personal:
            return "Personal"
        case .business:
            return "Business"
        case .income:
            return "Income"
        case .expenses:
            return "Expenses"
        case .assets:
            return "Assets"
        case .liabilities:
            return "Liabilities"
        case .revenue:
            return "Revenue"
        }
    }
    
    var submenu: [ViewType] {
        switch self {
        case .personal:
            return [
                .contentMenu(.income),
                .contentMenu(.expenses),
                .contentMenu(.assets),
                .contentMenu(.liabilities)
            ]
        case .business:
            return [
                .contentMenu(.income),
                .contentMenu(.expenses),
                .contentMenu(.assets),
                .contentMenu(.liabilities)
            ]
        case .income:
            return [
                .contentMenu(.income),
                .contentMenu(.expenses),
                .contentMenu(.assets),
                .contentMenu(.liabilities)
            ]
        case .expenses:
            return [
                .contentMenu(.income),
                .contentMenu(.expenses),
                .contentMenu(.assets),
                .contentMenu(.liabilities)
            ]
        case .assets:
            return [
                .contentMenu(.income),
                .contentMenu(.expenses),
                .contentMenu(.assets),
                .contentMenu(.liabilities)
            ]
        case .liabilities:
            return [
                .contentMenu(.income),
                .contentMenu(.expenses),
                .contentMenu(.assets),
                .contentMenu(.liabilities)
            ]
        case .revenue:
            return [
                .contentMenu(.income),
                .contentMenu(.expenses),
                .contentMenu(.assets),
                .contentMenu(.liabilities)
            ]
        }
    }
}

extension ContentMenu {
    @ViewBuilder
    var body: some View {
        ViewHome()
    }
}

