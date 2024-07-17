//
//  ViewHome.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI
import MapKit

struct ViewHome: View {
    @EnvironmentObject var authentication: Authentication
    
    @StateObject private var navigation = Navigation.instance
    
    @StateObject private var vm: ViewModelHome

    init() {
        _vm = StateObject(wrappedValue: ViewModelHome())
    }
    
    var body: some View {
        
        ZStack {
            ComponentMap()
            
            VStack {
                switch navigation.isView {
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
            
            VStack {
                Spacer()
                if (authentication.isLoggedIn ?? false) {
                    ComponentBar {
                        ComponentButtonBar(page: .manage)
                        ComponentButtonBar(page: .invest)
                        ComponentButtonBar(page: .services)
                    }
                }
            }
            .ignoresSafeArea()
        }
//        .onAppear {
//                    vm.checkAuthenticationStatus()
//                }
    }
}

//#Preview {
//    ViewHome(ViewModelHome())
//}
