//
//  GYAnimation.swift
//  SD
//
//  Created by lan on 2023/12/29.
//

import SwiftUI



enum GYAnimation {
    enum Duration: Double, CaseIterable, Identifiable {
        case t1 = 0.1 // 100ms
        case t2 = 0.2 // 200ms
        case t3 = 0.25 // 250ms
        case t4 = 0.3 // 300ms
        case t5 = 0.5 // 500ms
        case t6 = 0.8 // 800ms

        var id: Double { self.rawValue }
    }

    enum Expressive {
        case standard(Duration)
        case entrance(Duration)
        case exit(Duration)
        case spring(Duration)

        var duration: Double {
            switch self {
            case .standard(let duration),
                 .entrance(let duration),
                 .exit(let duration),
                 .spring(let duration):
                return duration.rawValue
            }
        }

        var identifier: String {
            switch self {
            case .standard: return "Standard"
            case .entrance: return "Entrance"
            case .exit: return "Exit"
            case .spring: return "Spring"
            }
        }
    }

    enum Dramatic {
        case standard(Duration)
        case entrance(Duration)
        case exit(Duration)
        case spring(Duration)

        var duration: Double {
            switch self {
            case .standard(let duration),
                 .entrance(let duration),
                 .exit(let duration),
                 .spring(let duration):
                return duration.rawValue
            }
        }

        var identifier: String {
            switch self {
            case .standard: return "Standard"
            case .entrance: return "Entrance"
            case .exit: return "Exit"
            case .spring: return "Spring"
            }
        }
    }

    static func expressive(for style: Expressive) -> Animation {
        let duration = style.duration

        switch style {
        case .standard:
            return .timingCurve(0.2, 0, 0.4, 0.9, duration: duration)
        case .entrance:
            return .timingCurve(0, 0.3, 0.4, 0.9, duration: duration)
        case .exit:
            return .timingCurve(0.2, 0, 0.9, 0.9, duration: duration)
        case .spring:
            let response = duration
            let dampingFraction = 0.8
            return .spring(response: response, dampingFraction: dampingFraction, blendDuration: 0)
        }
    }

    static func dramatic(for style: Dramatic) -> Animation {
        let duration = style.duration

        switch style {
        case .standard:
            return .timingCurve(0.4, 0.1, 0.3, 0.1, duration: duration)
        case .entrance:
            return .timingCurve(0, 0.3, 0.4, 1, duration: duration)
        case .exit:
            return .timingCurve(0.4, 0.1, 1, 1, duration: duration)
        case .spring:
            let response = duration
            let dampingFraction = 0.7
            return .spring(response: response, dampingFraction: dampingFraction)
        }
    }
}

extension GYAnimation.Expressive {
    static var allCases: [GYAnimation.Expressive] {
        let representativeDuration = GYAnimation.Duration.t1
        return [
            .standard(representativeDuration),
            .entrance(representativeDuration),
            .exit(representativeDuration),
            .spring(representativeDuration)
        ]
    }
}

extension GYAnimation.Dramatic {
    static var allCases: [GYAnimation.Expressive] {
        let representativeDuration = GYAnimation.Duration.t1
        return [
            .standard(representativeDuration),
            .entrance(representativeDuration),
            .exit(representativeDuration),
            .spring(representativeDuration)
        ]
    }
}
