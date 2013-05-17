//
//  FullScreenARViewController.m
//  AirPlayMusic
//
//  Created by Mac Mini on 5/16/13.
//  Copyright (c) 2013 Toan.Quach. All rights reserved.
//

#import "FullScreenARViewController.h"
#import "ViewController.h"

@interface FullScreenARViewController ()

@property (strong, nonatomic) IBOutlet UIButton *songTargetButton;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;

- (IBAction)closeButtonClicked:(id)sender;

@end

@implementation FullScreenARViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setSongTargetButton:nil];
    [self setCloseButton:nil];
    [super viewDidUnload];
}

- (IBAction)closeButtonClicked:(id)sender
{
    ViewController *parentView = (ViewController*)[self presentingViewController];
    [parentView closeFullScreen:nil];
}


- (void)bringToSubViews
{
    [self.view bringSubviewToFront:self.songTargetButton];
    [self.view bringSubviewToFront:self.closeButton];
}

@end
