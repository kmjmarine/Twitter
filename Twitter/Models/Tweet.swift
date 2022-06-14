//
//  Tweet.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/14.
//

import Foundation

struct Tweet: Codable {
    let user: User
    let contents: String
}
