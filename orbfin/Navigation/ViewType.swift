//
//  ViewType.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/17/24.
//

import Foundation
import SwiftUI

protocol ProtocolViewType {
    var label: String { get }
    var icon: String { get }
    var submenu: [ViewType] { get }
    @ViewBuilder var body: any View { get }
}

enum ViewType {
    case menu(Menu)
    case contentMenu(ContentMenu)
    case page(Page)
}

extension ViewType {
    var label: String {
        switch self {
        case .menu(let menu):
            return menu.label
        case .contentMenu(let contentMenu):
            return contentMenu.label
        case .page(let page):
            return page.label
        }
    }
    var icon: String {
        switch self {
        case .menu(let menu):
            return menu.icon
        case .contentMenu(let contentMenu):
            return contentMenu.icon
        case .page(let page):
            return page.icon
        }
    }
   
    var submenu: [ViewType] {
        switch self {
        case .menu(let menu):
            return menu.submenu
        case .contentMenu(let contentMenu):
            return contentMenu.submenu
        case .page(let page):
            return page.submenu
        }
    }
    
    var body: any View {
        switch self {
        case .menu(let menu):
            return menu.body
        case .contentMenu(let contentMenu):
            return contentMenu.body
        case .page(let page):
            return page.body
        }
    }
}
