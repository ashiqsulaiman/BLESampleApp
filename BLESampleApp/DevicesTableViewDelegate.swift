//
//  DevicesTableViewDelegate.swift
//  BLESampleApp
//
//  Created by Ashiq Sulaiman on 24/06/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scannedPeripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = scannedPeripherals[indexPath.item].name ?? "No devices found"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if scannedPeripherals.count > 0 {
            mainPeripheral = scannedPeripherals[indexPath.item]
            mainPeripheral?.delegate = self
            manager?.connect(mainPeripheral!)
        }
    }
}
