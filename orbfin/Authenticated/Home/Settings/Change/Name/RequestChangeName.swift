//
//  RequestChangeName.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

struct RequestChangeName: Encodable {
    let email: String
    let firstName: String
    let lastName: String
}
