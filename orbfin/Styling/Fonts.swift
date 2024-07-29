//
//  Fonts.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/28/24.
//

import Foundation
import SwiftUI

extension Styling {
    public static var kerning: CGFloat = 7
    
    static func font(component: Component) -> Font {
        switch component {
        case .title:
                .largeTitle
        case .button:
                .title
        case .card:
                .title
        case .icon:
                .title
        case .label:
                .headline
        case .value:
                .subheadline
        }
    }
}
