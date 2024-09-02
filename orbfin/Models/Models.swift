//
//  Models.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self),
              let json = try? JSONSerialization.jsonObject(with: data, options: []),
              let dictionary = json as? [String: Any] else {
            return nil
        }
        print(dictionary)
        return dictionary
    }
}
