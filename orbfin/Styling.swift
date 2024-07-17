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

enum ColorName {
    case Bar
    case BarFont
    case Button
    case ButtonFont
    case Card
    case CardFont
    case Caution
    case CautionFont
    case Error
    case ErrorFont
    case Font
    case Info
    case InfoFont
    case Input
    case InputFont
    case Shadow
    case Success
    case SuccessFont
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
    
    static func color(_ name: ColorName) -> Color {
        switch name {
        case .Bar:
            return Color("Bar")
        case .BarFont:
            return Color("BarFont")
        case .Button:
            return Color("Button")
        case .ButtonFont:
            return Color("ButtonFont")
        case .Card:
            return Color("Card")
        case .CardFont:
            return Color("CardFont")
        case .Error:
            return Color("Error")
        case .ErrorFont:
            return Color("ErrorFont")
        case .Font:
            return Color("Font")
        case .Info:
            return Color("Info")
        case .InfoFont:
            return Color("InfoFont")
        case .Input:
            return Color("Input")
        case .InputFont:
            return Color("InputFont")
        case .Shadow:
            return Color("Shadow")
        case .Success:
            return Color("Success")
        case .SuccessFont:
            return Color("SuccessFont")
        case .Caution:
            return Color("Success")
        case .CautionFont:
            return Color("SuccessFont")
        }
    }
}
