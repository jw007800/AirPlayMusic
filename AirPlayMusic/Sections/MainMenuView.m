//
//  MainMenuView.m
//  AirPlayMusic
//
//  Created by Mac Mini on 5/20/13.
//  Copyright (c) 2013 Toan.Quach. All rights reserved.
//

#import "MainMenuView.h"

@implementation MainMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)playListButtonClicked:(id)sender
{
    [UIAppDelegate.navigationController popToRootViewControllerAnimated:NO];
    
}

- (IBAction)settingButtonClicked:(id)sender
{
    
}
@end
