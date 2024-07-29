//
//  Commercial.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/18/24.
//

import SwiftUI

struct ViewCommercial: View {
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        ComponentCard {
            Button(action: {
                navigation.change(page: .commercialproperty)
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

#Preview {
    ViewCommercial()
}
