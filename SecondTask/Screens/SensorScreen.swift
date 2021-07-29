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

    let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    

    var body: some View {
        NavigationView {
            VStack {
                Text("Send Data").onReceive(timer) { _ in
                    sendSensorData()
                    print("\(Date())giya")
                }

                Group {
                    Text("Magnetometer Data")
                    Text("X: \(motionMagneto.x)")
                    Text("Y: \(motionMagneto.y)")
                    Text("Z: \(motionMagneto.z)")
                }

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

    func sendSensorData() {
        DispatchQueue.global().async {
            WebServices().sendSensorData(acceleroDataX: "\(motionAccelero.x)",
                                         acceleroDataY: "\(motionAccelero.y)",
                                         acceleroDataZ: "\(motionAccelero.z)",
                                         magnetoDataX: "\(motionMagneto.x)",
                                         magnetoDataY: "\(motionMagneto.y)",
                                         magnetoDataZ: "\(motionMagneto.z)")
        }
    }

//    func activeProximitySensor(_ enable: Bool) {
//       let device = UIDevice.current
//       device.isProximityMonitoringEnabled = enable
//       if device.isBatteryMonitoringEnabled {
//        NotificationCenter.default.addObserver(self, selector: Selector(("proximityChange")), name: UIDevice.proximityStateDidChangeNotification, object: device)
//       }
//
//    }
//    func proximityChange(_ notification: Notification) {
//       if let device = notification.object as? UIDevice {
//           print("\(device) detected")
//       }
//    }
}
