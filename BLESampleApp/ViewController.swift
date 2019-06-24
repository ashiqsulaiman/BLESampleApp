//
//  ViewController.swift
//  BLESampleApp
//
//  Created by Ashiq Sulaiman on 22/06/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate {
   
    @IBOutlet weak var devicesTableView: UITableView!
    var manager: CBCentralManager? = nil
    var scannedPeripherals: [CBPeripheral] = [] {
        didSet{
            self.devicesTableView.reloadData()
        }
    }
    var mainPeripheral: CBPeripheral? = nil
    var mainCharacteristic: CBCharacteristic? = nil
    var services: [CBUUID] = []
    
    //        let BLEService = "DFB0"
    //        let BLECharacteristic = "DFB1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        manager = CBCentralManager(delegate: self, queue: nil)
        devicesTableView.delegate = self
        devicesTableView.dataSource = self
    
    }
    
    private func setupUI(){
        self.title = "Scanned Devices"
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            toastView(messsage: "state: unknown", view: self.view)
        case .unsupported:
            toastView(messsage: "state: unsupported", view: self.view)
        case .unauthorized:
            toastView(messsage: "state: unauthorized", view: self.view)
        case .resetting:
            toastView(messsage: "state: resetting", view: self.view)
        case .poweredOn:
            toastView(messsage: "state: power on", view: self.view)
            manager?.scanForPeripherals(withServices: nil)
        case .poweredOff:
            toastView(messsage: "state: powered off", view: self.view)
        default:
            print("default")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !scannedPeripherals.contains(peripheral){
            scannedPeripherals.append(peripheral)
        }
//        print("peri are \(scannedPeripherals), \(scannedPeripherals.count)")
        manager?.stopScan()
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        toastView(messsage: "Connected", view: self.view)
        mainPeripheral?.discoverServices(nil)
    }
    
    func toastView(messsage : String, view: UIView ){
        let viewSize = view.frame.size
        let toastLabel = UILabel(frame: CGRect(x: viewSize.width/2 - 150, y: viewSize.height-100, width: 300,  height : 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.lightText
        toastLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(toastLabel)
        toastLabel.text = messsage
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 3;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 3.0, delay: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: {
            toastLabel.alpha = 0.0
            
        })
    }
}

