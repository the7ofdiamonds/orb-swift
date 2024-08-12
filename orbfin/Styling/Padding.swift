//
//  Padding.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/31/24.
//

import Foundation
import SwiftUI

extension Styling {
    static func padding(component: Component) -> CGFloat {
        switch component {
        case .card:
            25
            
        default: 20
        }
    }
    
    static func paddingEdgesTop() -> CGFloat {
        #if os(macOS)
            return 500
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 75
            } else {
                return 20
            }
        #endif
    }
    
    static func paddingEdgesHorizontal() -> CGFloat {
        #if os(macOS)
            return 25
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 25
            } else {
                return 25
            }
        #endif
    }
    
    static func paddingEdgesBottom() -> CGFloat {
        #if os(macOS)
            return 100
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 90
            } else {
                return 100
            }
        #endif
    }
}
