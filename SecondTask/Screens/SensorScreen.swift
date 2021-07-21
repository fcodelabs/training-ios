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

                Button(action: {
                    WebServices().sendSensorData(acceleroDataX: "\(motionAccelero.x)",
                                                 acceleroDataY: "\(motionAccelero.y)",
                                                 acceleroDataZ: "\(motionAccelero.z)",
                                                 magnetoDataX: "\(motionMagneto.x)",
                                                 magnetoDataY: "\(motionMagneto.y)",
                                                 magnetoDataZ: "\(motionMagneto.z)")
                }, label: {
                    Text("Button")
                })

//                Text("Gyro Data")
//                Text("X: \(motionGyro.x)")
//                Text("Y: \(motionGyro.y)")
//                Text("Z: \(motionGyro.z)")
            }
        }

        .navigationTitle("Sensors")
    }
}

// func activeProximitySensor(_ enable: Bool) {
//    let device = UIDevice.current
//    device.isProximityMonitoringEnabled = enable
//    if device.isBatteryMonitoringEnabled {
//        NotificationCenter.default.addObserver(self, selector: #selector(proximityChange), name: UIDevice.proximityStateDidChangeNotification, object: device)
//    }
//
// }
// func proximityChange(_ notification: Notification) {
//    if let device = notification.object as? UIDevice {
//        print("\(device) detected")
//    }
// }
