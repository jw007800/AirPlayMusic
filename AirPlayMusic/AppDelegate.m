//
//  AppDelegate.m
//  AirPlayMusic
//
//  Created by Mac Mini on 5/16/13.
//  Copyright (c) 2013 Toan.Quach. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"

// view
#import "MainMenuView.h"

@implementation AppDelegate

@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //
    //      Override point for customization after application launch.
    //
    //
    //      Create Home View Controller
    //
    HomeViewController *homeController = [[HomeViewController alloc] init];
    //
    //      Create Navigation Controller
    //
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:homeController];
    //
    //      Set Navigation for RootViewController
    //
    self.window.rootViewController = self.navigationController;
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    //
    //      SetupView
    //
    [self setupView];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - SetupView

- (void)setupView
{
    mainMenuView = [[[NSBundle mainBundle] loadNibNamed:@"MainMenuView" owner:self options:nil] objectAtIndex:0];
    mainMenuView.frame = CGRectMake(0, 0, 148, 48);
    [self.navigationController.view addSubview:mainMenuView];
}

- (void)showMainMenu
{
    mainMenuView.frame = CGRectMake(0, 0, 148, 48);
    mainMenuView.hidden = NO;
}

@end
