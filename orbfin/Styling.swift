//
//  Styling.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import Foundation
import SwiftUI

struct StylingShadow {
    var color: Color
    var radius: CGFloat
    var x: CGFloat
    var y: CGFloat
}

struct Styling {
    public static var H1: Font = .largeTitle
    public static var H2: Font = .largeTitle
    public static var H3: Font = .largeTitle
    public static var H4: Font = .largeTitle
    public static var font: Font = .largeTitle
    public static var kerning: CGFloat = 7
    
    public static var cornerRadius: CGFloat = 10
    public static var shadow: StylingShadow = StylingShadow(color: Color("Shadow"), radius: 3, x: 0, y: 0)
}
