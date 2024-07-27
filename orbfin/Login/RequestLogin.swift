//
//  RequestLogin.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/10/24.
//

import Foundation

struct RequestLogin: Encodable {
    let username: String
    let password: String
    let location: Coordinates
}
