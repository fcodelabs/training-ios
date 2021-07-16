//
//  MotionManagerVM.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-14.
//

import Combine
import CoreMotion
import SwiftUI

class AcceleroManager: ObservableObject {
    // MotionManager use the ObservableObject Combine property.
    private var acceleroManager: CMMotionManager

    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    // x, y and z use are Published so ContentView can read the values when they update.

    // init
    init() {
        acceleroManager = CMMotionManager()
        acceleroManager.accelerometerUpdateInterval = 0.5
        acceleroManager.startAccelerometerUpdates(to: .main) { accelerometerData, error in
            guard error == nil else {
                print(error!)
                return
            }

            if let acceleroData = accelerometerData {
                self.x = acceleroData.acceleration.x
                self.y = acceleroData.acceleration.y
                self.z = acceleroData.acceleration.z
            }
        }
    }
}
