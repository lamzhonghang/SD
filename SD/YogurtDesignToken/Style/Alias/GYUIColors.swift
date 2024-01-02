//
//  GYUIColors.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/21.
//

import SwiftUI

enum GYUIColors {
    // accent
    static var accent: Color {
        return Color(light: GYColors.xRed.xRed500,
                     dark: GYColors.xRed.xRed500)
    }

    // label
    enum label {
        static var primary: Color {
            return Color(light: GYColors.gray.gray800,
                         dark: GYColors.gray.gray200)
        }

        static var secondary: Color {
            return Color(light: GYColors.gray.gray550,
                         dark: GYColors.gray.gray300)
        }

        static var tertiary: Color {
            return Color(light: GYColors.gray.gray450,
                         dark: GYColors.gray.gray400)
        }

        static var quaternary: Color {
            return Color(light: GYColors.gray.gray350,
                         dark: GYColors.gray.gray500)
        }

        static var invert: Color {
            return Color(light: GYColors.gray.gray100,
                         dark: GYColors.gray.gray800)
        }

        static var disable: Color {
            return Color(light: GYColors.gray.gray200,
                         dark: GYColors.gray.gray500)
        }

        enum onColor {
            static var normal: Color {
                return Color(light: GYColors.base.white,
                             dark: GYColors.base.white)
            }

            static var hover: Color {
                return Color(light: GYColors.base.white,
                             dark: GYColors.base.white)
            }

            static var pressed: Color {
                return Color(light: GYColors.base.white,
                             dark: GYColors.base.white)
            }

            static var disable: Color {
                return Color(light: GYColors.base.white.opacity(0.7),
                             dark: GYColors.base.white.opacity(0.3))
            }
        }

        enum blue {
            static var normal = GYColors.base.blue
            static var hover = GYColors.blue.blue400
            static var pressed = GYColors.blue.blue600
            static var disable: Color {
                return Color(light: GYColors.blue.blue100,
                             dark: GYColors.blue.blue900)
            }
        }

        enum accent {
            static var normal = GYUIColors.accent
            static var hover = GYColors.xRed.xRed400
            static var pressed = GYColors.xRed.xRed600
            static var disable: Color {
                return Color(light: GYColors.xRed.xRed50,
                             dark: GYColors.xRed.xRed900)
            }
        }
    }

    // icon
    enum icon {
        static var primary = GYUIColors.label.primary
        static var secondary = GYUIColors.label.secondary
        static var tertiary = GYUIColors.label.tertiary
        static var quaternary = GYUIColors.label.quaternary
        static var disable = GYUIColors.label.disable

        enum onColor {
            static var normal = GYUIColors.label.onColor.normal
            static var pressed = GYUIColors.label.onColor.pressed
            static var disable = GYUIColors.label.onColor.disable
        }

        enum accent {
            static var normal = GYUIColors.label.accent.normal
            static var hover = GYUIColors.label.accent.hover
            static var pressed = GYUIColors.label.accent.pressed
            static var disable = GYUIColors.label.accent.disable
        }
    }

    // border
    enum border {
        static var primary = GYUIColors.label.primary
        static var secondary = GYUIColors.label.secondary
        static var tertiary = GYUIColors.label.tertiary
        static var quaternary = GYUIColors.label.quaternary
        static var muted: Color {
            return Color(light: GYColors.gray.gray150,
                         dark: GYColors.gray.gray700)
        }

        static var translusent: Color {
            return Color(light: Color(hex: "#747A80").opacity(0.2),
                         dark: Color(hex: "#747A80").opacity(0.25))
        }
    }

    // divider
    enum divider {
        static var onContainer: Color {
            return Color(light: GYColors.gray.gray250,
                         dark: GYColors.gray.gray600)
        }

        static var onSurfaceBright: Color {
            return Color(light: GYColors.gray.gray150,
                         dark: GYColors.gray.gray550)
        }

        static var onSurface: Color {
            return Color(light: GYColors.gray.gray200,
                         dark: GYColors.gray.gray700)
        }

        static var muted: Color {
            return Color(light: Color(hex: "#121416").opacity(0.06),
                         dark: Color(hex: "#E4E7EB").opacity(0.06))
        }
    }

    // fill
    enum fill {
        enum accent {
            static var normal = GYUIColors.accent
            static var hover = GYColors.xRed.xRed400
            static var pressed = GYColors.xRed.xRed600
            static var disable: Color {
                return Color(light: GYColors.xRed.xRed50,
                             dark: GYColors.xRed.xRed900)
            }
        }

        enum secondary {
            static var normal: Color {
                return Color(light: GYColors.gray.gray700,
                             dark: GYColors.gray.gray200)
            }

            static var hover: Color {
                return Color(light: GYColors.gray.gray600,
                             dark: GYColors.gray.gray100)
            }

            static var pressed: Color {
                return Color(light: GYColors.gray.gray750,
                             dark: GYColors.gray.gray300)
            }

            static var disable: Color {
                return Color(light: GYColors.gray.gray200,
                             dark: GYColors.gray.gray750)
            }
        }

        static var surface: Color {
            return Color(light: GYColors.gray.gray100,
                         dark: GYColors.gray.gray800)
        }

        static var surfaceDim: Color {
            return Color(light: GYColors.gray.gray200,
                         dark: GYColors.gray.gray900)
        }

        static var surfaceBright: Color {
            return Color(light: GYColors.gray.gray25,
                         dark: GYColors.gray.gray750)
        }

        static var container: Color {
            return Color(light: GYColors.gray.gray150,
                         dark: GYColors.gray.gray850)
        }

        static var containerDim: Color {
            return Color(light: GYColors.gray.gray250,
                         dark: GYColors.gray.gray700)
        }

        static var transparent: Color {
            return Color(light: GYColors.base.white.opacity(0),
                         dark: GYColors.base.black.opacity(0))
        }
    }

    // mask
    enum mask {
        static var backgroundDefault: Color {
            return Color(light: Color(hex: "#121416").opacity(0.3),
                         dark: Color(hex: "#121416").opacity(0.6))
        }

        static var overlayBright: Color {
            return Color(light: Color(hex: "#FFFFFF").opacity(0.5),
                         dark: Color(hex: "#EBF4FC").opacity(0.3))
        }

        static var overlayDeep: Color {
            return Color(light: Color(hex: "#1C2834").opacity(0.12),
                         dark: Color(hex: "#060A0E").opacity(0.3))
        }

        static var overlayS: Color {
            return Color(light: Color(hex: "#1C2834").opacity(0.05),
                         dark: Color(hex: "#EBF4FC").opacity(0.1))
        }

        static var overlayM: Color {
            return Color(light: Color(hex: "#1C2834").opacity(0.12),
                         dark: Color(hex: "#EBF4FC").opacity(0.16))
        }

        static var overlayL: Color {
            return Color(light: Color(hex: "#374047").opacity(0.3),
                         dark: Color(hex: "#EBF4FC").opacity(0.3))
        }

        static var overlayXL: Color {
            return Color(light: Color(hex: "#313436").opacity(0.8),
                         dark: Color(hex: "#EBF4FC").opacity(0.8))
        }

        static var invert: Color {
            return Color(light: GYColors.base.white.opacity(0.5),
                         dark: Color(hex: "#121416").opacity(0.15))
        }
    }

    // shadow
    enum shadow {
        static var elevationL401: Color {
            return Color(light: GYColors.base.black.opacity(0.25),
                         dark: GYColors.base.black.opacity(0.40))
        }

        static var elevationL402: Color {
            return Color(light: GYColors.base.black.opacity(0.1),
                         dark: GYColors.base.black.opacity(0.3))
        }

        static var elevationL301: Color {
            return Color(light: GYColors.base.black.opacity(0.2),
                         dark: GYColors.base.black.opacity(0.35))
        }

        static var elevationL302: Color {
            return Color(light: GYColors.base.black.opacity(0.1),
                         dark: GYColors.base.black.opacity(0.3))
        }

        static var elevationL201: Color {
            return Color(light: GYColors.base.black.opacity(0.15),
                         dark: GYColors.base.black.opacity(0.3))
        }

        static var elevationL202: Color {
            return Color(light: GYColors.base.black.opacity(0.1),
                         dark: GYColors.base.black.opacity(0.3))
        }

        static var elevationL101: Color {
            return Color(light: GYColors.base.black.opacity(0.1),
                         dark: GYColors.base.black.opacity(0.25))
        }

        static var elevationL102: Color {
            return Color(light: GYColors.base.black.opacity(0.08),
                         dark: GYColors.base.black.opacity(0.2))
        }

        static var elevationG01: Color {
            return Color(light: GYColors.base.black.opacity(0.06),
                         dark: GYColors.base.black.opacity(0.06))
        }

        static var elevationG02: Color {
            return Color(light: GYColors.base.black.opacity(0.03),
                         dark: GYColors.base.black.opacity(0.06))
        }
    }
}

// Below content is for display only.
struct ColorInfo: Hashable {
    var name: String
    var color: Color
}

extension GYUIColors.label {
    static let label: [ColorInfo] = [
        ColorInfo(name: "Primary", color: primary),
        ColorInfo(name: "Secondary", color: secondary),
        ColorInfo(name: "Tertiary", color: tertiary),
        ColorInfo(name: "Quaternary", color: quaternary),
        ColorInfo(name: "Disable", color: disable),
        ColorInfo(name: "Accent", color: accent.normal)
    ]
    static let Inverts: [ColorInfo] = [ColorInfo(name: "Invert", color: invert)]
    static let labelonColor: [ColorInfo] = [
        ColorInfo(name: "OnColor Normal", color: onColor.normal),
        ColorInfo(name: "OnColor Pressed", color: onColor.pressed),
        ColorInfo(name: "OnColor Disable", color: onColor.disable)
    ]
}

extension GYUIColors.fill {
    static let accentColors: [ColorInfo] = [
        ColorInfo(name: "Accent Normal", color: accent.normal),
        ColorInfo(name: "Accent Hover", color: accent.hover),
        ColorInfo(name: "Accent Pressed", color: accent.pressed),
        ColorInfo(name: "Accent Disable", color: accent.disable)
    ]

    static let secondaryColors: [ColorInfo] = [
        ColorInfo(name: "Secondary Normal", color: secondary.normal),
        ColorInfo(name: "Secondary Hover", color: secondary.hover),
        ColorInfo(name: "Secondary Pressed", color: secondary.pressed),
        ColorInfo(name: "Secondary Disable", color: secondary.disable)
    ]

    static let surfaceColors: [ColorInfo] = [
        ColorInfo(name: "Surface", color: surface),
        ColorInfo(name: "Surface Dim", color: surfaceDim),
        ColorInfo(name: "Surface Bright", color: surfaceBright)
    ]

    static let containerColors: [ColorInfo] = [
        ColorInfo(name: "Container", color: container),
        ColorInfo(name: "Container Dim", color: containerDim)
    ]

    static let transparentColor: [ColorInfo] = [
        ColorInfo(name: "Transparent", color: transparent)
    ]
}

extension GYUIColors.divider {
    static let allDividers: [ColorInfo] = [
        ColorInfo(name: "On Container", color: onContainer),
        ColorInfo(name: "On Surface Bright", color: onSurfaceBright),
        ColorInfo(name: "On Surface", color: onSurface),
        ColorInfo(name: "Muted", color: muted)
    ]
}

extension GYUIColors.border {
    static let allBorders: [ColorInfo] = [
        ColorInfo(name: "Primary", color: primary),
        ColorInfo(name: "Secondary", color: secondary),
        ColorInfo(name: "Tertiary", color: tertiary),
        ColorInfo(name: "Quaternary", color: quaternary),
        ColorInfo(name: "Muted", color: muted),
        ColorInfo(name: "Translusent", color: translusent)
    ]
}

extension GYUIColors.mask {
    static let allMasks: [ColorInfo] = [
        ColorInfo(name: "Background Default", color: backgroundDefault),
        ColorInfo(name: "Overlay Bright", color: overlayBright),
        ColorInfo(name: "Overlay Deep", color: overlayDeep),
        ColorInfo(name: "Overlay S", color: overlayS),
        ColorInfo(name: "Overlay M", color: overlayM),
        ColorInfo(name: "Overlay L", color: overlayL),
        ColorInfo(name: "Overlay XL", color: overlayXL),
        ColorInfo(name: "Invert", color: invert)
    ]
}
