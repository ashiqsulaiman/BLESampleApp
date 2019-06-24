//
//  RCTMainViewController.swift
//  BLESampleApp
//
//  Created by Ashiq Sulaiman on 24/06/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit
import React

class RCTMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        let rootView: RCTRootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "BLERN", initialProperties: [:], launchOptions: [:])
        self.view = rootView
    }
    


    

}
