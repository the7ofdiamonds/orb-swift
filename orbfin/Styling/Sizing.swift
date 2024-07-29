//
//  Sizing.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/28/24.
//

import Foundation
import UIKit

extension Styling {
    static func sizeWidth(component: Component) -> CGFloat {
        switch component {
        case .button:
            return 400
        case .card:
        #if os(macOS)
            return 400
        #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 400
            } else {
                return 800
            }
            
//            if UIDevice.current.userInterfaceIdiom == .pad {
//                return 700
//            }
        #endif
        case .icon:
            return 400
        case .label:
            return 400
        case .title:
            return 400
        case .value:
            return 400
        }
    }
}
