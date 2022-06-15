//
//  User.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/14.
//

import Foundation

struct User: Codable {
    var name: String
    var id: String
    
    static var shared = User(name: "박센징", id: "kmjmarine")
}


