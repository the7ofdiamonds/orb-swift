//
//  RequestSignup.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

struct RequestSignup: Encodable  {
    let username: String
    let email: String
    let password: String
    let confirmPassword: String
    let nicename: String
    let nickname: String
    let firstname: String
    let lastname: String
    let phone: String
    let location: Coordinates
}
