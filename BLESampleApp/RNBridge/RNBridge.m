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
        dispatch_async(dispatch_get_main_queue(), ^(void){
            ViewController*vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"devicesVC"];
            UINavigationBar* navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, UIApplication.sharedApplication.statusBarFrame.size.height, vc.view.frame.size.width, 50)];
            UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:@"Scanned Devices"];
            UIBarButtonItem* cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onTapCancel:)];
            navItem.leftBarButtonItem = cancelBtn;
            [navbar setItems:@[navItem]];
            [vc.view addSubview:navbar];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
        });
    }
    
    -(void)onTapCancel:(UIBarButtonItem*)item{
        [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
    }
    
@end
