//
//  SensorScreen.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-14.
//

import CoreMotion
import SwiftUI

struct SensorView: View {
    @ObservedObject var motionMagneto: MagnetoManager
    @ObservedObject var motionAccelero: AcceleroManager
    @ObservedObject var motionGyro: GyroManager

    var body: some View {
        NavigationView {
            VStack {
                Text("Magnetometer Data")
                Text("X: \(motionMagneto.x)")
                Text("Y: \(motionMagneto.y)")
                Text("Z: \(motionMagneto.z)")

                Text("Accelerometer Data")
                Text("X: \(motionAccelero.x)")
                Text("Y: \(motionAccelero.y)")
                Text("Z: \(motionAccelero.z)")

                Text("Gyro Data")
                Text("X: \(motionGyro.x)")
                Text("Y: \(motionGyro.y)")
                Text("Z: \(motionGyro.z)")
            }
        }

        .navigationTitle("Sensors")
    }
}
