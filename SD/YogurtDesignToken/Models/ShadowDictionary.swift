//
//  GYShadow.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/20.
//

import Foundation

struct ShadowEffect: Codable {
    var offsetX: CGFloat
    var offsetY: CGFloat
    var blur: CGFloat
    var spread: CGFloat
    var color: String
    var inset: Bool?
}

struct Elevation: Codable {
    var type: String
    var description: String
    var value: [ShadowEffect]
}

struct ElevationConfig: Codable {
    var elevationL4: Elevation
    var elevationL3: Elevation
    var elevationL2: Elevation
    var elevationL1: Elevation
    var elevationG: Elevation
    var elevationB1: Elevation

    enum CodingKeys: String, CodingKey {
        case elevationL4 = "elevation-l4"
        case elevationL3 = "elevation-l3"
        case elevationL2 = "elevation-l2"
        case elevationL1 = "elevation-l1"
        case elevationG = "elevation-g"
        case elevationB1 = "elevation-b1"
    }
}
