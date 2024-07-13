//
//  StatusBarSuccess.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

struct StatusBarStyling {
    var foregroundColor: Color
    var backgroundColor: Color
}

enum StatusBarType {
    case info
    case success
    case caution
    case error
}

struct StatusBar: View {
    var message: String = ""
    var type: StatusBarType?
    
    var styling: StatusBarStyling {
        switch type {
        case .info:
            return StatusBarStyling(foregroundColor: Styling.color(.InfoFont), backgroundColor: Styling.color(.Info))
        case .success:
            return StatusBarStyling(foregroundColor: Styling.color(.SuccessFont), backgroundColor: Styling.color(.Success))
        case .caution:
            return StatusBarStyling(foregroundColor: Styling.color(.CautionFont), backgroundColor: Styling.color(.Caution))
        case .error:
            return StatusBarStyling(foregroundColor: Styling.color(.ErrorFont), backgroundColor: Styling.color(.Error))
        default:
            return StatusBarStyling(foregroundColor: Styling.color(.InfoFont), backgroundColor: Styling.color(.Info))
        }
    }
    
    var body: some View {
        HStack{
            Text("\(message)")
                .foregroundColor(styling.foregroundColor)
                .padding()
        }
        .background(styling.backgroundColor)
        .cornerRadius(Styling.cornerRadius)
        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
    }
}

#Preview {
    StatusBar(message: "This is an info message", type: .info)
}
