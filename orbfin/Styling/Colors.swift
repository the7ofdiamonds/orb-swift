//
//  Colors.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/28/24.
//

import Foundation
import SwiftUI

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

extension Styling {
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
    
    static func colorStatusFont(type: Status) -> Color {
        switch type {
        case .error:
            return Color("ErrorFont")
        case .success:
            return Color("SuccessFont")
        case .caution:
            return Color("CautionFont")
        case .info:
            return Color("InfoFont")
        }
    }

    static func colorStatusBackground(type: Status) -> Color {
        switch type {
        case .error:
            return Color("Error")
        case .success:
            return Color("Success")
        case .caution:
            return Color("Caution")
        case .info:
            return Color("Info")
        }
    }
}
