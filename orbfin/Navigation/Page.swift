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

extension Page: ProtocolViewType {
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
        default:
            return ""
        }
    }
    
    var parent: ViewType {
        switch self {
        case .personal:
                .page(.manage)
        case .business:
                .page(.manage)
        case .settings:
                .page(.manage)
        case .forgot:
                .page(.manage)
        case .logout:
                .page(.manage)
        case .personalincome:
                .page(.personal)
        case .personalexpenses:
                .page(.personal)
        case .personalassets:
                .page(.personal)
        case .personalliabilities:
                .page(.personal)
        case .personaltransactions:
                .page(.personal)
        case .businessincome:
                .page(.business)
        case .businessrevenue:
                .page(.business)
        case .businessexpenses:
                .page(.business)
        case .businessequity:
                .page(.business)
        case .businessassets:
                .page(.business)
        case .businessliabilities:
                .page(.business)
        case .businesscontra:
                .page(.business)
        case .businesstax:
                .page(.business)
        case .businesstransactions:
                .page(.business)
        case .realestate:
                .page(.invest)
        case .commercial:
                .page(.realestate)
        case .residential:
                .page(.realestate)
        case .tangibleassets:
                .page(.invest)
        case .tangibleassetsrealestate:
                .page(.tangibleassets)
        case .tangibleassetscommercial:
                .page(.tangibleassetsrealestate)
        case .tangibleassetsresidential:
                .page(.tangibleassetsrealestate)
        case .tangibleassetsbusiness:
                .page(.tangibleassets)
        case .notary:
                .page(.services)
        default:
            .page(.blank)
        }
    }
    
    var submenu: [ViewType] {
        []
    }
}

extension Page {
    
    var body: any View {
        switch self {
        case .home:
            ViewHome()
        case .login:
            ViewLogin()
        case .signup:
            ViewSignUp()
          
        case .manage:
            ViewManage()
        
        case .personal:
            ViewManagePersonal()
        case .personalincome:
            ViewManagePersonalIncome()
        case .personalrevenue:
            ViewManagePersonalRevenue()
        case .personalexpenses:
            ViewManagePersonalExpenses()
        case .personalequity:
            ViewManagePersonalEquity()
        case .personalassets:
            ViewManagePersonalAssets()
        case .personalliabilities:
            ViewManagePersonalLiabilities()
        case .personalcontra:
            ViewManagePersonalContra()
        case .personaltax:
            ViewManagePersonalTax()
        case .personaltransactions:
            ViewManagePersonalTransactions()
            
        case .business:
            ViewManageBusiness()
        case .businessincome:
            ViewManageBusinessIncome()
        case .businessrevenue:
            ViewManageBusinessRevenue()
        case .businessexpenses:
            ViewManageBusinessExpenses()
        case .businessequity:
            ViewManageBusinessEquity()
        case .businessassets:
            ViewManageBusinessAssets()
        case .businessliabilities:
            ViewManageBusinessLiabilities()
        case .businesscontra:
            ViewManageBusinessContra()
        case .businesstax:
            ViewManageBusinessTax()
        case .businesstransactions:
            ViewManageBusinessTransactions()
         
        case .settings:
            ViewSettings()
        case .forgot:
            ViewForgot()
        case .logout:
            ViewLogout()
            
        case .invest:
            ViewInvest()
        case .realestate:
            ViewRealEstate()
        case .commercial:
            ViewCommercial()
        case .residential:
            ViewResidential()
        case .tangibleassets:
            ViewTangibleAssets()
        case .tangibleassetsrealestate:
            ViewTangibleAssetsRealEstate()
        case .tangibleassetscommercial:
            ViewTangibleAssetsCommercial()
        case .tangibleassetsresidential:
            ViewTangibleAssetsResidential()
        case .tangibleassetsbusiness:
            ViewTangibleAssetsBusiness()
        case .paperassets:
            ViewInvest()
            
        case .services:
            ViewServices()
        case .notary:
            ViewNotary()
            
        case .blank:
            EmptyView()
        }
    }
}

extension Page {
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


