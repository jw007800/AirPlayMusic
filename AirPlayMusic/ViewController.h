//
//  ViewController.h
//  AirPlayMusic
//
//  Created by Mac Mini on 5/16/13.
//  Copyright (c) 2013 Toan.Quach. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARKit.h"

@interface ViewController : UIViewController<ARLocationDelegate,ARDelegate,ARMarkerDelegate>

- (IBAction)closeFullScreen:(id)sender;

@end
