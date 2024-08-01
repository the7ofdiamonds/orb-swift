//
//  Sizing.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/28/24.
//

import Foundation
import SwiftUI

extension Styling {
    static func sizeWidth(component: Component) -> CGFloat {
        switch component {
        case .card:
        #if os(macOS)
            return 400
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 350
            } else {
                return 800
            }
        #endif
            
        default:
            return 400
        }
    }
    
    static func sizeHeight(component: Component) -> CGFloat {
        switch component {
        case .card:
        #if os(macOS)
            return 500
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 700
            } else {
                return 700
            }
        #endif
            
        default:
            return 400
        }
    }
    
    static func sizeWidthPhoto() -> CGFloat {
        #if os(macOS)
            return 400
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 350
            } else {
                return 900
            }
        #endif
    }
    
    static func sizeHeightPhoto() -> CGFloat {
        #if os(macOS)
            return 400
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 350
            } else {
                return 650
            }
        #endif
    }
}
