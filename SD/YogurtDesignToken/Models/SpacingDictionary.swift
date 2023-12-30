//
//  SpacingDictionary.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import Foundation

struct SpacingDictionary: Codable {
    let size: [String: TokenValue]
    let padding: [String: TokenValue]
    let margin: [String: TokenValue]
}

struct TokenValue: Codable {
    let type: String
    let value: Int

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case value = "$value"
    }
}
