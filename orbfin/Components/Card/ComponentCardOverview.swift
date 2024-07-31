//
//  ComponentCardOverview.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/29/24.
//

import SwiftUI

struct ComponentCardOverview: View {
    var overview: String
    
    var body: some View {
        ComponentCard(title: "Overview") {
            ScrollView {
            Text(overview)
                .font(Styling.font(component: .card))
            }
        }
    }
}

#Preview {
    ComponentCardOverview(overview: "Discover the potential of 68 McDowell St, a unique commercial property nestled in the heart of Franklinton, Columbus, Ohio. This property offers a distinctive blend of office, retail, and restaurant space, making it a versatile investment opportunity. The property’s strategic location in Franklinton, the first American settlement in Franklin County, places it in a vibrant and diverse community. It’s adjacent to Gravity 2.0, Ohio’s most expansive conscious community, and Franklinton’s newest restaurant, Prim Mason, adding to its appeal. The property itself is a two-story building with an additional basement level, each floor offering 2,324 SF of creative space. An adjacent 900-space parking garage provides ample parking for employees and customers alike. As a potential office space, the property offers a unique environment for businesses looking for a creative and inspiring workspace. For retailers, the property’s location next to Gravity 2.0 and Prim Mason could bring in significant foot traffic. If used as a restaurant space, the vibrant Franklinton community and proximity to Gravity 2.0 could be a major draw for customers. The property is not just a building; it’s part of a thriving business community and cultural hub. It’s more than just a location; it’s a statement about your business’s commitment to community, creativity, and innovation. Invest in 68 McDowell St and become part of the vibrant Franklinton community. This property is more than just a space; it’s an opportunity to be part of something bigger. Please note that the property’s specific features and potential uses may change over time, and it’s important to verify all information before making a decision. Invest in 68 McDowell St and become part of the vibrant Franklinton community. This property is more than just a space; it’s an opportunity to be part of something bigger.")
}
