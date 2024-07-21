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
    case tangibleassetsrealestate
    case tangibleassetscommercial
    case tangibleassetsresidential
    case tangibleassetsbusiness
    case paperassets
    case transactions
    case income
    case revenue
    case expenses
    case equity
    case assets
    case liabilities
    case contra
    case tax
    case notary
    case settings
    case personal
    case business
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
        case .tangibleassetscommercial:
            return "Commercial"
        case .tangibleassetsresidential:
            return "Residential"
        case .tangibleassetsbusiness:
            return "Business"
        case .paperassets:
            return "Paper Assets"
        case .transactions:
            return "Transactions"
        case .income:
            return "Income"
        case .revenue:
            return "Revenue"
        case .expenses:
            return "Expenses"
        case .equity:
            return "Equity"
        case .assets:
            return "Assets"
        case .liabilities:
            return "Liabilities"
        case .contra:
            return "Contra"
        case .tax:
            return "Tax"
        case .notary:
            return "Notary"
        case .settings:
            return "Settings"
        case .personal:
            return "Personal"
        case .business:
            return "Business"
        case .personaltransactions:
            return "Personal Transactions"
        case .businesstransactions:
            return "Business Transactions"
        case .commercial:
            return "Commercial"
        case .residential:
            return "Residential"
        case .tangibleassetsrealestate:
            return "Real Estate"
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
        case .tangibleassetscommercial:
            return "building"
        case .tangibleassetsresidential:
            return "building"
        case .tangibleassetsbusiness:
            return "building"
        case .paperassets:
            return "chart.line.uptrend.xyaxis"
        case .transactions:
            return "Transactions"
        case .income:
            return "income"
        case .revenue:
            return "Revenue"
        case .expenses:
            return "Expenses"
        case .equity:
            return "Equity"
        case .assets:
            return "Assets"
        case .liabilities:
            return "Liabilities"
        case .contra:
            return "Contra"
        case .tax:
            return "Tax"
        case .notary:
            return "signature"
        case .settings:
            return "gear"
        case .personal:
            return "Personal"
        case .business:
            return "Business"
        case .personaltransactions:
            return "personaltransactions"
        case .businesstransactions:
            return "businesstransactions"
        case .commercial:
            return "building"
        case .residential:
            return "house"
        case .tangibleassets:
            return "tangible"
        case .tangibleassetsrealestate:
            return "building"
        }
    }
    
    var submenu: [ViewType] {
        []
    }
}

extension Page {
    
    var body: any View {
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
        case .equity:
            ViewManageEquity()
        case .assets:
            ViewManageAssets()
        case .liabilities:
            ViewManageLiabilities()
        case .contra:
            ViewManageContra()
        case .tax:
            ViewManageTax()
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
        case .home:
            ViewHome()
        case .login:
            ViewLogin()
        case .signup:
            ViewSignUp()
        case .realestate:
            ViewRealEstate()
        case .tangibleassets:
            ViewTangibleAssets()
        case .tangibleassetscommercial:
            ViewTangibleAssetsBusiness()
        case .tangibleassetsresidential:
            ViewTangibleAssetsBusiness()
        case .paperassets:
            ViewInvest()
        case .transactions:
            ViewInvest()
        case .notary:
            ViewNotary()
        case .settings:
            ViewSettings(selectedLayoutExperience: .constant(.threeColumn))
        case .commercial:
            ViewCommercial()
        case .residential:
            ViewResidential()
        case .tangibleassetsbusiness:
            ViewTangibleAssetsBusiness()
        case .tangibleassetsrealestate:
            ViewTangibleAssetsRealEstate()
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
        case "Commercial":
            self = .commercial
        case "Residential":
            self = .residential
        case "Tangible Assets Commercial":
            self = .tangibleassetscommercial
        case "Tangible Assets Residential":
            self = .tangibleassetsresidential
        case "Tangible Assets Business":
            self = .tangibleassetsbusiness
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
        case "Contra":
            self = .contra
        case "Tax":
            self = .tax
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


