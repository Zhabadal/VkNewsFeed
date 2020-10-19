//
//  UserResponse.swift
//  VkNewsFeed
//
//  Created by Alexandr Badmaev on 19.10.2020.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
