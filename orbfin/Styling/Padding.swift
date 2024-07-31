//
//  Padding.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/31/24.
//

import Foundation

extension Styling {
    static func padding(component: Component) -> CGFloat {
        switch component {
        case .card:
            25
        default: 20
        }
    }
}
