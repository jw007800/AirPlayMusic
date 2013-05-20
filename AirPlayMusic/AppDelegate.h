//
//  AppDelegate.h
//  AirPlayMusic
//
//  Created by Mac Mini on 5/16/13.
//  Copyright (c) 2013 Toan.Quach. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuView;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>
{
    MainMenuView *mainMenuView;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

// Method

- (void)setupView;

- (void)showMainMenu;

@end
