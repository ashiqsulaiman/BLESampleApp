//
//  RNBridge.m
//  BLESampleApp
//
//  Created by Ashiq Sulaiman on 24/06/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

#import "RNBridge.h"
#import "BLESampleApp-Swift.h"

@implementation RNBridge
    
    // To export a module named RNBridge
    RCT_EXPORT_MODULE();
    
    // This would name the module RNBridge instead
    // RCT_EXPORT_MODULE(RNBridge);
    RCT_EXPORT_METHOD(showDevices)
    {
        ViewController*vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"devicesVC"];

        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
    }
    @end
