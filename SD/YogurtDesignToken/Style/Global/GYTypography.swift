//
//  GYTypography.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import SwiftUI

enum GYTypography: String, CaseIterable {
    case headlineLarge = "Headline Large"
    case headlineMedium = "Headline Medium"
    case subheadLarge = "Subhead Large"
    case subheadMedium = "Subhead Medium"
    case subheadSmall = "Subhead Small"
    case subheadMini = "Subhead Mini"
    case bodyLarge = "Body Large"
    case bodyMedium = "Body Medium"
    case bodySmall = "Body Small"
    case captionHeader = "Caption Header"
    case captionFooter = "Caption Footer"
    case caption = "Caption"
    case captionSmall = "Caption Small"

    enum FontSize {
        static let headlineLarge: CGFloat = 34
        static let headlineMedium: CGFloat = 24
        static let subheadLarge: CGFloat = 21
        static let subheadMedium: CGFloat = 19
        static let subheadSmall: CGFloat = 17
        static let subheadMini: CGFloat = 15
        static let bodyLarge: CGFloat = 17 // default
        static let bodyMedium: CGFloat = 15
        static let bodySmall: CGFloat = 13
        static let captionHeader: CGFloat = 13
        static let captionFooter: CGFloat = 13
        static let caption: CGFloat = 12
        static let captionSmall: CGFloat = 11
    }

    enum FontWeight {
        static let ultraLight: Font.Weight = .ultraLight
        static let thin: Font.Weight = .thin
        static let light: Font.Weight = .light
        static let regular: Font.Weight = .regular // default
        static let medium: Font.Weight = .medium
        static let semibold: Font.Weight = .semibold
        static let bold: Font.Weight = .bold
        static let heavy: Font.Weight = .heavy
        static let black: Font.Weight = .black
    }

    enum FontLetterSpacing {
        static let headlineLarge: CGFloat = 1.0
        static let headlineMedium: CGFloat = 0.8
        static let subheadLarge: CGFloat = 0.8
        static let subheadMedium: CGFloat = 0.6
        static let subheadSmall: CGFloat = 0.6
        static let subheadMini: CGFloat = 0.4
        static let bodyLarge: CGFloat = 0.4
        static let bodyMedium: CGFloat = 0.4
        static let bodySmall: CGFloat = 0.2
        static let captionHeader: CGFloat = 0.2
        static let captionFooter: CGFloat = 0.2
        static let caption: CGFloat = 0.2
        static let captionSmall: CGFloat = 0.2
    }

    enum FontLineHeight {
        static let headlineLarge: CGFloat = 4.0
        static let headlineMedium: CGFloat = 4.0
        static let subheadLarge: CGFloat = 4.0
        static let subheadMedium: CGFloat = 4.0
        static let subheadSmall: CGFloat = 4.0
        static let subheadMini: CGFloat = 4.0
        static let bodyLarge: CGFloat = 4.0
        static let bodyMedium: CGFloat = 4.0
        static let bodySmall: CGFloat = 4.0
        static let captionHeader: CGFloat = 4.0
        static let captionFooter: CGFloat = 4.0
        static let caption: CGFloat = 4.0
        static let captionSmall: CGFloat = 4.0
    }

    enum FontFamily: String {
        case neverMind = "NeverMind" // Title
        case neverMindSemiCondensed = "NeverMind SemiCondensed" // Text
    }

    struct GYTypographyModifier: ViewModifier {
        var typography: GYTypography

        func body(content: Content) -> some View {
            switch typography {
            case .headlineLarge:
                return content
                    .font(.custom(FontFamily.neverMind.rawValue, size: FontSize.headlineLarge, relativeTo: .largeTitle))
                    .fontWeight(FontWeight.bold)
                    .kerning(FontLetterSpacing.headlineLarge)
                    .lineSpacing(FontLineHeight.headlineLarge)

            case .headlineMedium:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.headlineMedium, relativeTo: .title))
                    .fontWeight(FontWeight.bold)
                    .kerning(FontLetterSpacing.headlineMedium)
                    .lineSpacing(FontLineHeight.headlineMedium)
            case .subheadLarge:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.subheadLarge, relativeTo: .title2))
                    .fontWeight(FontWeight.bold)
                    .kerning(FontLetterSpacing.subheadLarge)
                    .lineSpacing(FontLineHeight.subheadLarge)
            case .subheadMedium:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.subheadMedium, relativeTo: .title3))
                    .fontWeight(FontWeight.bold)
                    .kerning(FontLetterSpacing.subheadMedium)
                    .lineSpacing(FontLineHeight.subheadMedium)
            case .subheadSmall:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.subheadSmall, relativeTo: .callout))
                    .fontWeight(FontWeight.bold)
                    .kerning(FontLetterSpacing.subheadSmall)
                    .lineSpacing(FontLineHeight.subheadSmall)
            case .subheadMini:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.subheadMini, relativeTo: .subheadline))
                    .fontWeight(FontWeight.bold)
                    .kerning(FontLetterSpacing.subheadMini)
                    .lineSpacing(FontLineHeight.subheadMini)
            case .bodyLarge:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.bodyLarge, relativeTo: .body))
                    .fontWeight(FontWeight.regular)
                    .kerning(FontLetterSpacing.bodyLarge)
                    .lineSpacing(FontLineHeight.bodyLarge)
            case .bodyMedium:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.bodyMedium, relativeTo: .body))
                    .fontWeight(FontWeight.regular)
                    .kerning(FontLetterSpacing.bodyMedium)
                    .lineSpacing(FontLineHeight.bodyMedium)
            case .bodySmall:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.bodySmall, relativeTo: .body))
                    .fontWeight(FontWeight.regular)
                    .kerning(FontLetterSpacing.bodySmall)
                    .lineSpacing(FontLineHeight.bodySmall)
            case .captionHeader:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.captionHeader, relativeTo: .caption))
                    .fontWeight(FontWeight.regular)
                    .kerning(FontLetterSpacing.captionHeader)
                    .lineSpacing(FontLineHeight.captionHeader)
            case .captionFooter:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.captionFooter, relativeTo: .caption))
                    .fontWeight(FontWeight.regular)
                    .kerning(FontLetterSpacing.captionFooter)
                    .lineSpacing(FontLineHeight.captionFooter)
            case .caption:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.caption, relativeTo: .caption))
                    .fontWeight(FontWeight.regular)
                    .kerning(FontLetterSpacing.caption)
                    .lineSpacing(FontLineHeight.caption)
            case .captionSmall:
                return content
                    .font(.custom(FontFamily.neverMindSemiCondensed.rawValue, size: FontSize.captionSmall, relativeTo: .caption2))
                    .fontWeight(FontWeight.regular)
                    .kerning(FontLetterSpacing.captionSmall)
                    .lineSpacing(FontLineHeight.captionSmall)
            }
        }
    }
}

extension View {
    func GYTypo(_ typography: GYTypography) -> some View {
        return modifier(GYTypography.GYTypographyModifier(typography: typography))
    }
}
