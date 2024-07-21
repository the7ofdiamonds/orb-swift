//
//  LayoutExperienceSetting.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/20/24.
//

enum LayoutExperienceSetting: String, CaseIterable, Identifiable {
    case twoColumn = "twoColumn"
    case threeColumn = "threeColumn"
}

extension LayoutExperienceSetting {
    var id: String {
        switch self {
        case .twoColumn:
            return "1"
        case .threeColumn:
            return "2"
        }
    }

    var title: String {
        switch self {
        case .twoColumn:
            return "Two Column"
        case .threeColumn:
            return "Three Column"
        }
    }
    
    var imageName: String {
        switch self {
        case .twoColumn:
            return "sidebar.left"
        case .threeColumn:
            return "rectangle.split.3x1"
        }
    }
    
    var description: String {
        switch self {
        case .twoColumn:
            return ""
        case .threeColumn:
            return ""
        }
    }
}

extension LayoutExperienceSetting {
    init?(title: String) {
        switch title {
        case "Two Column":
            self = .twoColumn
        case "Three Column":
            self = .threeColumn
        default:
            self = .threeColumn
        }
    }
}
