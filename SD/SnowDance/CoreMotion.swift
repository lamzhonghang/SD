//
//  CoreMotion.swift
//  SD
//
//  Created by lan on 2023/10/21.
//

import CoreMotion
import SwiftUI

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()

    @Published var x = 0.0
    @Published var y = 0.0

    init() {
        motionManager.deviceMotionUpdateInterval = 1 / 15
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, _ in
            withAnimation {
                guard let motion = data?.attitude else { return }
                self?.x = motion.roll
                self?.y = motion.pitch
            }
        }
    }
}
