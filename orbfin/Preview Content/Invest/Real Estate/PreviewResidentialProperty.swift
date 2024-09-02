//
//  PreviewResidentialProperty.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/4/24.
//

import Foundation

class PreviewResidentialProperty {
    static func loadProperty() -> RealEstateProperty {
        var property = RealEstateProperty(id: 1, providerID: 1)
        property.images = ["https://photos.zillowstatic.com/fp/6fdab9937e2a88d57e5c393816fa94a9-cc_ft_1536.webp"]
        
        property.streetAddress = "439 Baker Cir NW"
        property.city = "Atlanta"
        property.state = "GA"
        property.zipcode = "30318"
        property.country = ""

        property.overview = "Discover the potential of 68 McDowell St, a unique commercial property nestled in the heart of Franklinton, Columbus, Ohio. This property offers a distinctive blend of office, retail, and restaurant space, making it a versatile investment opportunity. The property’s strategic location in Franklinton, the first American settlement in Franklin County, places it in a vibrant and diverse community. It’s adjacent to Gravity 2.0, Ohio’s most expansive conscious community, and Franklinton’s newest restaurant, Prim Mason, adding to its appeal. The property itself is a two-story building with an additional basement level, each floor offering 2,324 SF of creative space. An adjacent 900-space parking garage provides ample parking for employees and customers alike. As a potential office space, the property offers a unique environment for businesses looking for a creative and inspiring workspace. For retailers, the property’s location next to Gravity 2.0 and Prim Mason could bring in significant foot traffic. If used as a restaurant space, the vibrant Franklinton community and proximity to Gravity 2.0 could be a major draw for customers. The property is not just a building; it’s part of a thriving business community and cultural hub. It’s more than just a location; it’s a statement about your business’s commitment to community, creativity, and innovation. Invest in 68 McDowell St and become part of the vibrant Franklinton community. This property is more than just a space; it’s an opportunity to be part of something bigger. Please note that the property’s specific features and potential uses may change over time, and it’s important to verify all information before making a decision. Invest in 68 McDowell St and become part of the vibrant Franklinton community. This property is more than just a space; it’s an opportunity to be part of something bigger."
        
        property.highlights = [
            "Unique office or retail creative space.",
            "Owner/user or investment opportunity.",
            "Two stories plus a basement.",
            "900 space parking garage is adjacent to the property."
        ]
        
        property.price = 1390000
        property.priceSF = 299
        property.capRate = 0
        property.leased = 0
        property.tenancy = "Single"
        property.saleType = "Investment Or Owner User"
        
        property.propertyType = "Retail"
        property.propertySubType = "Restaurant"
        property.additionalSubTypes = ["Storefront Retail/Residential", "Loft/Creative Space"]
        property.stories = 2
        property.yearbuilt = 1925
        property.sprinklers = "-"
        property.parkingSpaces = 0
       
        
        property.landAcres = 0.22
        property.landSqft = 9583
        property.zoning = "C"
        property.apnParcelID = "010-042942"
        
        return property
    }
}
