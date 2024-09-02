//
//  Service.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import Foundation
import MapKit

struct Service: Identifiable, Codable, Equatable {
    var id: Int
    var created: String?
    var updated: String?
    var type: String
    var name: String?
    var content: String?
    var description: String?
    var currency: String?
    var price: Double
    var features: String?
    var onboarding_link: String?
    var icon: String?
    var button_icon: String?
    var action_word: String?
    var price_id: String?
    var url: String?
    var address: Address?
    var coordinates: Coordinates?
    var mapLocation: MapLocation?

    enum CodingKeys: String, CodingKey {
        case id, created, updated, type, name, content, description, currency, price, features, onboarding_link, icon, button_icon, action_word, price_id, url, address, coordinates, mapLocation
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        created = try? container.decode(String.self, forKey: .created)
        updated = try? container.decode(String.self, forKey: .updated)
        type = try container.decode(String.self, forKey: .type)
        name = try? container.decode(String.self, forKey: .name)
        content = try? container.decode(String.self, forKey: .content)
        description = try? container.decode(String.self, forKey: .description)
        currency = try? container.decode(String.self, forKey: .currency)
        price = try container.decode(Double.self, forKey: .price)
        features = try? container.decode(String.self, forKey: .features)
        onboarding_link = try? container.decode(String.self, forKey: .onboarding_link)
        icon = try? container.decode(String.self, forKey: .icon)
        button_icon = try? container.decode(String.self, forKey: .button_icon)
        action_word = try? container.decode(String.self, forKey: .action_word)
        price_id = try? container.decode(String.self, forKey: .price_id)
        url = try? container.decode(String.self, forKey: .url)
        address = try? container.decode(Address.self, forKey: .address)
        coordinates = try? container.decode(Coordinates.self, forKey: .coordinates)
        mapLocation = try? container.decode(MapLocation.self, forKey: .mapLocation)
    }
    
    static func == (lhs: Service, rhs: Service) -> Bool {
        lhs.id == rhs.id
    }
}
