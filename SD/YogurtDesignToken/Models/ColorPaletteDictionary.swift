//
//  ColorPalette.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import Foundation

struct ColorPalette: Codable {
    let base: [String: ColorReference]
    let red, xRed, orange, yellow, lime, green, teal, cyan, blue, indigo, violet, purple, pink, gray: [String: ColorValue]

    enum CodingKeys: String, CodingKey {
        case base
        case red, orange, yellow, lime, green, teal, cyan, blue, indigo, violet, purple, pink, gray
        case xRed = "x-red"
    }
}

struct ColorReference: Codable {
    let type: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case value = "$value"
    }
}

struct ColorValue: Codable {
    let type: String
    let hex: String

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case hex = "$value"
    }
}
