//
//  MainMenuView.h
//  AirPlayMusic
//
//  Created by Mac Mini on 5/20/13.
//  Copyright (c) 2013 Toan.Quach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuView : UIView
{
    __weak IBOutlet UIButton *playListButton;
    
    __weak IBOutlet UIButton *settingButton;
}
- (IBAction)playListButtonClicked:(id)sender;
- (IBAction)settingButtonClicked:(id)sender;

@end
