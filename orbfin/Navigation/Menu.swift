//
//  Menu.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/17/24.
//

import Foundation
import SwiftUI

enum Menu: CaseIterable {
    case home
    case manage
    case invest
    case services
    case realestate
    case tangibleassets
//    case paperassets
}

extension Menu: ProtocolViewType {
    var label: String {
        switch self {
        case .home:
            return "Home"
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
//        case .paperassets:
//            return "Paper Assets"
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
        }
    }
    
    var submenu: [ViewType] {
        switch self {
        case .home:
           return [
                .menu(.manage),
                .menu(.invest),
                .menu(.services)
            ]
        case .manage:
            return [
                 .contentMenu(.personal),
                 .contentMenu(.business),
                 .page(.settings),
                 .page(.forgot),
                 .page(.logout)
            ]
        case .invest:
            return [
                 .page(.realestate),
                 .page(.tangibleassets),
             ]
        case .services:
            return [
                .page(.notary)
             ]
        case .realestate:
            return [
                 .page(.commercial),
                 .page(.residential)
            ]
        case .tangibleassets:
            return [
                 .page(.realestate),
                 .page(.business)
             ]
//        case .paperassets:
//            return [
//                 .menu(.manage),
//                 .menu(.invest),
//                 .menu(.services)
//             ]
        }
    }
}

extension Menu {
    @ViewBuilder
    var body: any View {
        switch self {
        case .home:
            ViewHome()
        case .manage:
            ViewManage()
        case .invest:
            ViewInvest()
        case .services:
            ViewServices()
        case .realestate:
            ViewInvest()
        case .tangibleassets:
            ViewInvest()
//        case .paperassets:
//            ViewInvest()
        }
    }
}
