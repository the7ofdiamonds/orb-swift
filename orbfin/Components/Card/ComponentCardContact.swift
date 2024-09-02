//
//  ComponentCardContact.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/27/24.
//

import SwiftUI

struct ComponentCardContact: View {
    var action: (@escaping () -> Void) -> Void

    var body: some View {
        ComponentCard {
            ComponentButtonContact { completion in
                action {
                    completion()
                }
            }
        }
    }
}

#Preview {
    ComponentCardContact { completion in
        print("Contact action triggered")
        completion()
    }
}
