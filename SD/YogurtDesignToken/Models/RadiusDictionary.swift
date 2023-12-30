//
//  Radius.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import Foundation

struct RadiusDictionary: Codable {
    var radii: [String: RadiusValue]
    enum CodingKeys: String, CodingKey {
        case radii = "radiusDictionary"
    }
}

struct RadiusValue: Codable {
    var type: String
    var value: Int
    var description: String?

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case value = "$value"
        case description = "$description"
    }
}
