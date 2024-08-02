//
//  Menu.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/17/24.
//

import Foundation
import SwiftUI

enum Menu: CaseIterable, Identifiable {
    case home
    case login
    case signup
    
    case manage
    
    case personal
    case personalincome
    case personalrevenue
    case personalexpenses
    case personalequity
    case personalassets
    case personalliabilities
    case personalcontra
    case personaltax
    case personaltransactions
    
    case business
    case businessincome
    case businessrevenue
    case businessexpenses
    case businessequity
    case businessassets
    case businessliabilities
    case businesscontra
    case businesstax
    case businesstransactions
    
    case settings
    case forgot
    case logout
    
    case invest
    case realestate
    case commercial
    case residential
    case tangibleassets
    case tangibleassetsrealestate
    case tangibleassetscommercial
    case tangibleassetsresidential
    case tangibleassetsbusiness
    case paperassets
    
    case services
    case notary
    
    case blank
}

extension Menu {
    var id: String {
        UUID().uuidString
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .login:
            return "Login"
        case .signup:
            return "Signup"
            
        case .manage:
            return "Manage"
            
        case .personal:
            return "Personal"
        case .personalincome:
            return "Personal Income"
        case .personalrevenue:
            return "Personal Revenue"
        case .personalexpenses:
            return "Personal Expenses"
        case .personalequity:
            return "Personal Equity"
        case .personalassets:
            return "Personal Assets"
        case .personalliabilities:
            return "Personal Liabilities"
        case .personalcontra:
            return "Personal Contra"
        case .personaltax:
            return "Personal Tax"
        case .personaltransactions:
            return "Personal Transactions"
            
        case .business:
            return "Business"
        case .businessincome:
            return "Business Income"
        case .businessrevenue:
            return "Business Revenue"
        case .businessexpenses:
            return "Business Expenses"
        case .businessequity:
            return "Business Equity"
        case .businessassets:
            return "Business Assets"
        case .businessliabilities:
            return "Business Liabilities"
        case .businesscontra:
            return "Business Contra"
        case .businesstax:
            return "Business Tax"
        case .businesstransactions:
            return "Business Transactions"
        case .settings:
            return "Settings"
        case .forgot:
            return "Forgot"
        case .logout:
            return "Logout"
            
        case .invest:
            return "Invest"
        case .realestate:
            return "Real Estate"
        case .commercial:
            return "Commercial"
        case .residential:
            return "Residential"
        case .tangibleassets:
            return "Tangible Assets"
        case .tangibleassetsrealestate:
            return "Tangible Assets Real Estate"
        case .tangibleassetscommercial:
            return "Tangible Assets Commercial"
        case .tangibleassetsresidential:
            return "Tangible Assets Residential"
        case .tangibleassetsbusiness:
            return "Tangible Assets Business"
        case .paperassets:
            return "Paper Assets"
            
        case .services:
            return "Services"
        case .notary:
            return "Notary"
            
        case .blank:
            return ""
        }
    }
    
    var label: String {
        switch self {
        case .home:
            return "Home"
        case .login:
            return "Login"
        case .signup:
            return "Signup"
            
        case .manage:
            return "Manage"
            
        case .personal:
            return "Personal"
        case .personalincome:
            return "Income"
        case .personalrevenue:
            return "Revenue"
        case .personalexpenses:
            return "Expenses"
        case .personalequity:
            return "Equity"
        case .personalassets:
            return "Assets"
        case .personalliabilities:
            return "Liabilities"
        case .personalcontra:
            return "Contra"
        case .personaltax:
            return "Tax"
        case .personaltransactions:
            return "Personal Transactions"
            
        case .business:
            return "Business"
        case .businessincome:
            return "Income"
        case .businessrevenue:
            return "Revenue"
        case .businessexpenses:
            return "Expenses"
        case .businessequity:
            return "Equity"
        case .businessassets:
            return "Assets"
        case .businessliabilities:
            return "Liabilities"
        case .businesscontra:
            return "Contra"
        case .businesstax:
            return "Tax"
        case .businesstransactions:
            return "Business Transactions"
        case .settings:
            return "Settings"
        case .forgot:
            return "Forgot"
        case .logout:
            return "Logout"
            
        case .invest:
            return "Invest"
        case .realestate:
            return "Real Estate"
        case .commercial:
            return "Commercial"
        case .residential:
            return "Residential"
        case .tangibleassets:
            return "Tangible Assets"
        case .tangibleassetsrealestate:
            return "Real Estate"
        case .tangibleassetscommercial:
            return "Commercial"
        case .tangibleassetsresidential:
            return "Residential"
        case .tangibleassetsbusiness:
            return "Business"
        case .paperassets:
            return "Paper Assets"
            
        case .services:
            return "Services"
        case .notary:
            return "Notary"
            
        case .blank:
            return ""
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "house"
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
            //        case .paperassets:
            //            return "chart.line.uptrend.xyaxis"
        default:
            return ""
        }
    }
    
    var parent: Menu? {
        switch self {
        case .manage:
                .home
        case .invest:
                .home
        case .services:
                .home
        case .settings:
                .home
        case .forgot:
                .home
        case .logout:
                .home
        case .personal:
                .manage
        case .business:
                .manage
        case .personalincome:
                .personal
        case .personalexpenses:
                .personal
        case .personalassets:
                .personal
        case .personalliabilities:
                .personal
        case .personaltransactions:
                .personal
        case .businessincome:
                .business
        case .businessrevenue:
                .business
        case .businessexpenses:
                .business
        case .businessequity:
                .business
        case .businessassets:
                .business
        case .businessliabilities:
                .business
        case .businesscontra:
                .business
        case .businesstax:
                .business
        case .businesstransactions:
                .business
        case .realestate:
                .invest
        case .commercial:
                .realestate
        case .residential:
                .realestate
        case .tangibleassets:
                .invest
        case .tangibleassetsrealestate:
                .tangibleassets
        case .tangibleassetscommercial:
                .tangibleassetsrealestate
        case .tangibleassetsresidential:
                .tangibleassetsrealestate
        case .tangibleassetsbusiness:
                .tangibleassets
        case .notary:
                .services
        default:
                nil
        }
    }
    
    var submenu: [Menu] {
        switch self {
        case .home:
            return [
                .settings,
                .forgot,
                .logout
            ]
        case .manage:
            return [
                .personal,
                .business
            ]
        case .personal:
            return [
                .personalincome,
                .personalexpenses,
                .personalassets,
                .personalliabilities,
                .personaltransactions
            ]
        case .business:
            return [
                .businessrevenue,
                .businessincome,
                .businessexpenses,
                .businessassets,
                .businessliabilities,
                .businesscontra,
                .businesstax,
                .businesstransactions
            ]
        case .settings:
            return []
        case .invest:
            return [
                .realestate,
                .tangibleassets,
            ]
        case .realestate:
            return [
                .commercial,
                .residential
            ]
        case .tangibleassets:
            return [
                .tangibleassetsrealestate,
                .tangibleassetsbusiness
            ]
        case .tangibleassetsrealestate:
            return [
                .tangibleassetscommercial,
                .tangibleassetsresidential
            ]
        case .tangibleassetsbusiness:
            return []
        case .services:
            return [
                .notary
            ]
        default:
            return []
        }
    }
}

extension Menu {
    init?(title: String) {
        switch title {
        case "Home":
            self = .home
        case "Login":
            self = .login
        case "Signup":
            self = .signup
            
        case "Manage":
            self = .manage
            
        case "Personal":
            self = .personal
        case "Personal Income":
            self = .personalincome
        case "Personal Revenue":
            self = .personalrevenue
        case "Personal Expenses":
            self = .personalexpenses
        case "Personal Assets":
            self = .personalassets
        case "Personal Liabilities":
            self = .personalliabilities
        case "Personal Contra":
            self = .personalcontra
        case "Personal Tax":
            self = .personaltax
        case "Personal Transactions":
            self = .personaltransactions
            
        case "Business":
            self = .business
        case "Business Income":
            self = .businessincome
        case "Business Revenue":
            self = .businessrevenue
        case "Business Expenses":
            self = .businessexpenses
        case "Business Assets":
            self = .businessassets
        case "Business Liabilities":
            self = .businessliabilities
        case "Business Equity":
            self = .businessequity
        case "Business Contra":
            self = .businesscontra
        case "Business Tax":
            self = .businesstax
        case "Business Transactions":
            self = .businesstransactions
            
        case "Settings":
            self = .settings
        case "Forgot":
            self = .forgot
        case "Logout":
            self = .logout
            
        case "Invest":
            self = .invest
        case "Real Estate":
            self = .realestate
        case "Commercial":
            self = .commercial
        case "Residential":
            self = .residential
        case "Tangible Assets":
            self = .tangibleassets
        case "Tangible Assets Real Estate":
            self = .tangibleassetsrealestate
        case "Tangible Assets Commercial":
            self = .tangibleassetscommercial
        case "Tangible Assets Residential":
            self = .tangibleassetsresidential
        case "Tangible Assets Business":
            self = .tangibleassetsbusiness
        case "Paper Assets":
            self = .paperassets
            
        case "Services":
            self = .services
        case "Notary":
            self = .notary
            
        default:
            return nil
        }
    }
}
