//
//  Page.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import Foundation

enum Page: String {
    case home = "home"
    case login = "login"
    case signup = "signup"
    case forgot = "forgot"
    case logout = "logout"
    case manage = "manage"
    case invest = "invest"
    case services = "services"
    case realestate = "realestate"
    case tangibleassets = "tangibleassets"
    case paperassets = "paperassets"
    case transactions = "transactions"
    case income = "income"
    case expenses = "expenses"
    case assets = "assets"
    case liabilities = "liabilities"
    case notary = "notary"
    case settings = "settings"
    case personal = "personal"
    case business = "business"
    case revenue = "revenue"
    case personaltransactions = "personaltransactions"
    case businesstransactions = "businesstransactions"
    
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
        }
    }
}
