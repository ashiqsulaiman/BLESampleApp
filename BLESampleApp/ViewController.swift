//
//  ViewController.swift
//  BLESampleApp
//
//  Created by Ashiq Sulaiman on 22/06/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate {
   
    var manager: CBCentralManager? = nil
    var mainPeripheral: CBPeripheral? = nil
    var mainCharacteristic: CBCharacteristic? = nil
    
    //        let BLEService = "DFB0"
    //        let BLECharacteristic = "DFB1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CBCentralManager(delegate: self, queue: nil)
        

        
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("unknown")
        case .unsupported:
            print("unsupported")
        case .unauthorized:
            print("unauthorized")
        case .resetting:
            print("resetting")
        case .poweredOn:
            print("power on")
        case .poweredOff:
            print("power off")
        default:
            print("default")
        }
    }

}

