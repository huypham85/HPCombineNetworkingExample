//
//  User.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 1/6/24.
//

import Foundation

struct User: Codable {
    let userId: String
    let name: String
    let email: String
}

struct APIResponse<T: Codable>: Codable {
    let status: String
    let message: String
    let data: T
}

extension User {
    static func testUserData() -> User {
        return User(userId: "1", name: "Huy Pham", email: "huy2001@gmail.com")
    }
}
