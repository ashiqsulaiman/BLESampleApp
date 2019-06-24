//
//  PeripheralDelegate.swift
//  BLESampleApp
//
//  Created by Ashiq Sulaiman on 24/06/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit
import CoreBluetooth

extension ViewController: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else {return}
        for service in services {
            print(service.uuid)
            peripheral.discoverCharacteristics(nil, for: service)
            self.services.append(service.uuid)
        }
        
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }
        for characteristic in characteristics {
            //            print(characteristic)
            if characteristic.properties.contains(.read) {
                print("\(characteristic.uuid): properties contains .read")
                peripheral.readValue(for: characteristic)
            }
            if characteristic.properties.contains(.notify) {
                print("\(characteristic.uuid): properties contains .notify")
            }
            
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        //        switch characteristic.uuid {
        //        case <#pattern#>:
        //            <#code#>
        //        default:
        //            <#code#>
        //        }
        
        print("char uuid is \(characteristic.value)")
    }
}

