//
//  ViewServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/16/24.
//

import SwiftUI

struct ViewServices: View {
    var body: some View {
        ComponentCard {
            
            HStack {
                ComponentButtonBar(page: .notary)
            }
        }
    }
}

#Preview {
    ViewServices()
}
