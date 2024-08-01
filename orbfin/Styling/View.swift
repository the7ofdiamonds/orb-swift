//
//  View.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/31/24.
//

import Foundation
import SwiftUI

extension Styling {
    static func tabViewType() -> some TabViewStyle {
        #if os(macOS)
        return DefaultTabViewStyle()
        #else
                return .page(indexDisplayMode: .automatic)
        #endif
    }
}
