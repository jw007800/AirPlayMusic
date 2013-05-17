//
//  ViewController.m
//  AirPlayMusic
//
//  Created by Mac Mini on 5/16/13.
//  Copyright (c) 2013 Toan.Quach. All rights reserved.
//

#import "ViewController.h"
#import "FullScreenARViewController.h"

@interface ViewController ()
{
    AugmentedRealityController *arc;
}

@property (weak, nonatomic) IBOutlet UIView *arView;

- (IBAction)airPlayMusicButtonClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Event

- (IBAction)clearARView:(id)sender
{
    [arc unloadAV];
    [[[self arView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    arc = nil;
}

- (IBAction)closeFullScreen:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [arc unloadAV];
    arc = nil;
}

- (IBAction)airPlayMusicButtonClicked:(id)sender
{
    if ([ARKit deviceSupportsAR])
    {
        if (arc != nil)
            [self clearARView:self];
        
        FullScreenARViewController *fullScreenVC = [[FullScreenARViewController alloc] initWithNibName:@"FullScreenARViewController" bundle:nil];
        
        arc = [[AugmentedRealityController alloc] initWithView:[fullScreenVC view] parentViewController:fullScreenVC withDelgate:self];
        
        //[arc setDebugMode:[[ContentManager sharedContentManager] debugMode]];
        //[arc setScaleViewsBasedOnDistance:[[ContentManager sharedContentManager] scaleOnDistance]];
        //[arc setMinimumScaleFactor:0.5];
        //[arc setRotateViewsBasedOnPerspective:YES];
        //[arc updateDebugMode:![arc debugMode]];
        
//        UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
//        
//        [closeBtn setTitle:@"Close" forState:UIControlStateNormal];
//        
//        [closeBtn setBackgroundColor:[UIColor greenColor]];
//        [closeBtn addTarget:self action:@selector(closeFullScreen:) forControlEvents:UIControlEventTouchUpInside];
        
        //[[fullScreenVC view] addSubview:closeBtn];
        
        [fullScreenVC bringToSubViews];
        
        [fullScreenVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:fullScreenVC animated:YES completion:nil];
        
        //[self populateGeoLocations];
    }
    else
    {
       // [self notSupportView];
    }
}

-(void) didTapMarker:(ARGeoCoordinate *) coordinate
{
    NSLog(@"delegate worked click on %@", [coordinate title]);
    [self locationClicked:coordinate];
    
}

-(void) didUpdateHeading:(CLHeading *)newHeading
{
    //   NSLog(@"Heading Updated");
    
}

-(void) didUpdateLocation:(CLLocation *)newLocation
{
    NSLog(@"Location Updated");
    
}
-(void) didUpdateOrientation:(UIDeviceOrientation) orientation
{
    NSLog(@"Orientation Updated");
    
    if (orientation == UIDeviceOrientationPortrait)
        NSLog(@"Protrait");
}


@end
