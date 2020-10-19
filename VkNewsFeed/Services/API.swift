//
//  API.swift
//  VkNewsFeed
//
//  Created by Alexandr Badmaev on 02.10.2020.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.124"
    
    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
}
