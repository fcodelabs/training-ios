//
//  GyroVM.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-15.
//


import Combine
import CoreMotion
import SwiftUI

class GyroManager: ObservableObject {
    // MotionManager use the ObservableObject Combine property.
    private var gyroManager: CMMotionManager

    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    // x, y and z use are Published so ContentView can read the values when they update.

    // init
    init() {
        gyroManager = CMMotionManager()
        gyroManager.gyroUpdateInterval = 0.5
        gyroManager.startGyroUpdates(to: .main) { gyroData, error in
            guard error == nil else {
                print(error!)
                return
            }

            if let gData = gyroData {
                self.x = gData.rotationRate.x
                self.y = gData.rotationRate.y
                self.z = gData.rotationRate.z
            }
        }
    }
}
