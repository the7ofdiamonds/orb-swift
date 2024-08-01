//
//  Styling.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import Foundation
import SwiftUI

enum Component {
    case title
    case card
    case button
    case icon
    case label
    case value
    case edges
}

struct StylingShadow {
    var color: Color
    var radius: CGFloat
    var x: CGFloat
    var y: CGFloat
}


struct Styling {
    public static var cornerRadius: CGFloat = 10
    public static var shadow: StylingShadow = StylingShadow(color: Color("Shadow"), radius: 3, x: 0, y: 0)
}
