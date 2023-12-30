//
//  GYRadius.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import Foundation

enum GYRadius: CaseIterable {
    private static let radiusDictionary: RadiusDictionary? = loadRadiusDictionary()

    static let xxs3 = radiusValue(for: "xxs-3", default: 3)
    static let xs4 = radiusValue(for: "xs-4", default: 4)
    static let s8 = radiusValue(for: "s-8", default: 8)
    static let m12 = radiusValue(for: "m-12", default: 12)
    static let l16 = radiusValue(for: "l-16", default: 16)
    static let xl24 = radiusValue(for: "xl-24", default: 24)
    static let xxl36 = radiusValue(for: "xxl-36", default: 36)
    static let xxxl48 = radiusValue(for: "xxxl-48", default: 48)

    private static func radiusValue(for key: String, default defaultValue: Int) -> CGFloat {
        CGFloat(radiusDictionary?.radii[key]?.value ?? defaultValue)
    }
}

extension GYRadius {
    static let allRadius: [CGFloat] = [
        GYRadius.xxs3,
        GYRadius.xs4,
        GYRadius.s8,
        GYRadius.m12,
        GYRadius.l16,
        GYRadius.xl24,
        GYRadius.xxl36,
        GYRadius.xxxl48
    ]
}
