//
//  ViewHomeContentMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/23/24.
//

import SwiftUI

struct ViewHomeContentMenu: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var vmCommercial: ViewModelCommercial

    private let manage: Page = Page.manage
    private let invest: Page = Page.invest
    private let services: Page = Page.services
    
    func titlesMatch(_ title1: String, _ title2: String) -> Bool {
        return title1.localizedCompare(title2) == .orderedSame
    }
        
    private var isHomeMenu: Bool {
        if let menu = navigation.isPage {
            let title = menu.title
            
            let isManage = titlesMatch(manage.title, title)
            let isInvest = titlesMatch(invest.title, title)
            let isServices = titlesMatch(services.title, title)
                        
            return isManage || isInvest || isServices
        } else {
            return false
        }
    }
    
    private var currentPageMenu: Page {
        if isHomeMenu {
            return .blank
        } else {
            if let menu = navigation.isPage {
                return menu
            } else {
                return .blank
            }
        }
    }
}

extension ViewHomeContentMenu {
    var body: some View {
        VStack {
            if !isHomeMenu {
                switch navigation.isPage {
                case .commercial:
                    ViewRealEstateCommercialMenu()
                default:
                    Section {
                        List {
                            ComponentButtonMenu(menu: currentPageMenu)
                                .fontWeight(.bold)

                            let submenu = currentPageMenu.submenu
                            
                            ForEach(submenu, id: \.id) { menu in
                                ComponentButtonMenu(menu: menu)
                            }
                        }
                    }
                }
            }
            
            if let menu = navigation.isPage {
                if !isHomeMenu {
                    Section {
                        List {
                            if let parent = menu.parent {
                                ComponentButtonMenu(menu: parent)
                                    .fontWeight(.bold)

                                let submenu = parent.submenu
                                
                                ForEach(submenu) { menu in
                                    ComponentButtonMenu(menu: menu)
                                }
                            }
                        }
                    }
                }
            }
            
            if currentPageMenu == .blank && isHomeMenu {
                Text("Make a selection")
            }
        }
    }
}

#Preview {
    ViewHomeContentMenu()
        .environmentObject(Navigation())
        .environmentObject(ViewModelCommercial())
}
