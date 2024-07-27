//
//  RequestChangeUsername.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

struct RequestChangeUsername: Encodable {
    let email: String
    let password: String
    let username: String
}
