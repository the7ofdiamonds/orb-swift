//
//  RequestChangePassword.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

struct RequestChangePassword: Encodable {
    let password: String
    let confirmPassword: String
}
