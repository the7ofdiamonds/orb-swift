//
//  Page.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import Foundation
import SwiftUI

enum Page: CaseIterable {
    case home
    case login
    case signup
    case forgot
    case logout
    case manage
    case invest
    case services
    case realestate
    case tangibleassets
    case paperassets
    case transactions
    case income
    case expenses
    case assets
    case liabilities
    case notary
    case settings
    case personal
    case business
    case revenue
    case personaltransactions
    case businesstransactions
    case commercial
    case residential
}

extension Page: ProtocolViewType {
    
    var label: String {
        switch self {
        case .home:
            return "Home"
        case .login:
            return "Login"
        case .signup:
            return "Signup"
        case .forgot:
            return "Forgot"
        case .logout:
            return "Logout"
        case .manage:
            return "Manage"
        case .invest:
            return "Invest"
        case .services:
            return "Services"
        case .realestate:
            return "Real Estate"
        case .tangibleassets:
            return "Tangible Assets"
        case .paperassets:
            return "Paper Assets"
        case .transactions:
            return "Transactions"
        case .income:
            return "Income"
        case .expenses:
            return "Expenses"
        case .assets:
            return "Assets"
        case .liabilities:
            return "Liabilities"
        case .notary:
            return "Notary"
        case .settings:
            return "Settings"
        case .personal:
            return "Personal"
        case .business:
            return "Business"
        case .revenue:
            return "Revenue"
        case .personaltransactions:
            return "Personal Transactions"
        case .businesstransactions:
            return "Business Transactions"
        case .commercial:
            return "Commercial"
        case .residential:
            return "Residential"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .login:
            return "key"
        case .signup:
            return "plus.circle"
        case .forgot:
            return "questionmark.circle"
        case .logout:
            return "key.slash"
        case .manage:
            return "gear"
        case .invest:
            return "dollarsign.circle"
        case .services:
            return "wrench"
        case .realestate:
            return "house"
        case .tangibleassets:
            return "building"
        case .paperassets:
            return "chart.line.uptrend.xyaxis"
        case .transactions:
            return "Transactions"
        case .income:
            return "income"
        case .expenses:
            return "Expenses"
        case .assets:
            return "Assets"
        case .liabilities:
            return "Liabilities"
        case .notary:
            return "signature"
        case .settings:
            return "gear"
        case .personal:
            return "Personal"
        case .business:
            return "Business"
        case .revenue:
            return "Revenue"
        case .personaltransactions:
            return "personaltransactions"
        case .businesstransactions:
            return "businesstransactions"
        case .commercial:
            return "building"
        case .residential:
            return "house"
        }
    }
}

extension Page {
    @ViewBuilder
    var body: some View {
        switch self {
        case .forgot:
            ViewForgot()
        case .logout:
            ViewLogout()
        case .manage:
            ViewManage()
        case .income:
            ViewManageIncome()
        case .revenue:
            ViewManageRevenue()
        case .expenses:
            ViewManageExpenses()
        case .assets:
            ViewManageAssets()
        case .liabilities:
            ViewManageLiabilities()
        case .personal:
            ViewManagePersonal()
        case .personaltransactions:
            ViewManagePersonalTransactions()
        case .business:
            ViewManageBusiness()
        case .businesstransactions:
            ViewManageBusinessTransactions()
        case .invest:
            ViewInvest()
        case .services:
            ViewServices()
        default:
            EmptyView()
        }
    }
}

extension Page {
    init?(label: String) {
        switch label {
        case "Home":
            self = .home
        case "Login":
            self = .login
        case "Signup":
            self = .signup
        case "Forgot":
            self = .forgot
        case "Logout":
            self = .logout
        case "Manage":
            self = .manage
        case "Invest":
            self = .invest
        case "Services":
            self = .services
        case "Real Estate":
            self = .realestate
        case "Tangible Assets":
            self = .tangibleassets
        case "Paper Assets":
            self = .paperassets
        case "Transactions":
            self = .transactions
        case "Income":
            self = .income
        case "Expenses":
            self = .expenses
        case "Assets":
            self = .assets
        case "Liabilities":
            self = .liabilities
        case "Notary":
            self = .notary
        case "Settings":
            self = .settings
        case "Personal":
            self = .personal
        case "Business":
            self = .business
        case "Revenue":
            self = .revenue
        case "Personal Transactions":
            self = .personaltransactions
        case "Business Transactions":
            self = .businesstransactions
        
        default:
            return nil
        }
    }
}


