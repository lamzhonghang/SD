//
//  TypographyDictionary.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import Foundation

struct TypographyDictionary: Codable {
    let headline: [String: TypographyStyle]
    let subhead: [String: TypographyStyle]
    let body: [String: TypographyStyle]
    let caption: [String: TypographyStyle]
    let icon: [String: [String: TypographyStyle]]

    enum CodingKeys: String, CodingKey {
        case headline = "Headline"
        case subhead = "Subhead"
        case body = "Body"
        case caption = "Caption"
        case icon = "Icon"
    }
}

struct TypographyStyle: Codable {
    let type: String
    let value: TypographyValue

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case value = "$value"
    }
}

struct TypographyValue: Codable {
    let fontFamily: String
    let fontSize: String
    let fontWeight: Int
    let letterSpacing: String
    let lineHeight: String
}
