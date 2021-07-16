//
//  MotionManagerVM.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-14.
//

import Combine
import CoreMotion
import SwiftUI

class MagnetoManager: ObservableObject {
    // MotionManager use the ObservableObject Combine property.
    private var motionManager: CMMotionManager

    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    // x, y and z use are Published so ContentView can read the values when they update.

    // init
    init() {
        motionManager = CMMotionManager()
        motionManager.magnetometerUpdateInterval = 0.5
        motionManager.startMagnetometerUpdates(to: .main) { magnetometerData, error in
            guard error == nil else {
                print(error!)
                return
            }

            if let magnetData = magnetometerData {
                self.x = magnetData.magneticField.x
                self.y = magnetData.magneticField.y
                self.z = magnetData.magneticField.z
            }
        }
    }
}
