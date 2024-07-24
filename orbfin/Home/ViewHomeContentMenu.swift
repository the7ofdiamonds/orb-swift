//
//  ViewHomeContentMenu.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/23/24.
//

import SwiftUI

struct ViewHomeContentMenu: View {
    @EnvironmentObject var navigation: Navigation
    
    private let manage: Menu = Menu.manage
    private let invest: Menu = Menu.invest
    private let services: Menu = Menu.services
    
    func titlesMatch(_ title1: String, _ title2: String) -> Bool {
        return title1.localizedCompare(title2) == .orderedSame
    }
        
    private var isHomeMenu: Bool {
        if let menu = navigation.isMenu {
            let title = menu.title
            
            let isManage = titlesMatch(manage.title, title)
            let isInvest = titlesMatch(invest.title, title)
            let isServices = titlesMatch(services.title, title)
                        
            return isManage || isInvest || isServices
        } else {
            return false
        }
    }
    
    private var currentPageMenu: Menu {
        if isHomeMenu {
            return .blank
        } else {
            if let menu = navigation.isMenu {
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
            if currentPageMenu != .blank && !isHomeMenu {
                Section {
                    List {
                        Button(action: {
                            navigation.change(menu: currentPageMenu)
                        }, label: {
                            Text(currentPageMenu.label)
                        })
                        .font(.headline)
                        .fontWeight(.bold)
                        
                        let submenu = currentPageMenu.submenu
                        
                        ForEach(submenu, id: \.id) { menu in
                            Button(action: {
                                navigation.change(menu: menu)
                            }, label: {
                                Text(menu.label)
                            })
                        }
                    }
                }
            }
            
            
            if let menu = navigation.isMenu {
                if !isHomeMenu {
                    Section {
                        List {
                            if let parent = menu.parent {
                                Button(action: {
                                    navigation.change(menu: parent)
                                }, label: {
                                    Text(parent.label)
                                })
                                .font(.headline)
                                .fontWeight(.bold)
                                
                                let submenu = parent.submenu
                                
                                ForEach(submenu) { menu in
                                    Button(action: {
                                        navigation.change(menu: menu)
                                    }, label: {
                                        Text(menu.label)
                                    })
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
}
