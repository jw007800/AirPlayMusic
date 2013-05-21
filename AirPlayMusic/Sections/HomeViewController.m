//
//  HomeViewController.m
//  AirPlayMusic
//
//  Created by Mac Mini on 5/20/13.
//  Copyright (c) 2013 Toan.Quach. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    __weak IBOutlet UIButton *playButton;
    __weak IBOutlet UIImageView *sloganTextImageView;
    __weak IBOutlet UILabel *detailTextLabel;

    ARViewController    *_arViewController;
}

@property (nonatomic, weak) UIView *arView;
@property (nonatomic, strong) UIImagePickerController *cameraController;

- (void)setupView;

- (IBAction)playButtonClicked:(id)sender;

@end

@implementation HomeViewController

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
    [self setupView];
}

- (void)viewDidAppear:(BOOL)animated
{
    _arViewController = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    //arc = nil;
    self.arView = nil;
    playButton = nil;
    sloganTextImageView = nil;
    detailTextLabel = nil;
    [super viewDidUnload];
}

#pragma mark - Setup View

- (void)setupView
{
    // Align control
    CGRect rect = playButton.frame;
    rect.origin.x = [[UIScreen mainScreen] bounds].size.height/2 - rect.size.width/2;
    playButton.frame = rect;
    
    rect = detailTextLabel.frame;
    rect.origin.x = [[UIScreen mainScreen] bounds].size.height/2 - rect.size.width/2;
    detailTextLabel.frame = rect;
    
    rect = sloganTextImageView.frame;
    rect.origin.x = [[UIScreen mainScreen] bounds].size.height/2 - rect.size.width/2;
    sloganTextImageView.frame = rect;
}

#pragma mark - Button Event

- (IBAction)playButtonClicked:(id)sender
{
    if ([ARKit deviceSupportsAR])
    {
        _arViewController = [[ARViewController alloc] initWithDelegate:self];
        [_arViewController setShowsRadar:NO];
        //[_arViewController setRadarBackgroundColour:[UIColor blackColor]];
        //[_arViewController setRadarViewportColour:[UIColor darkGrayColor]];
        //[_arViewController setRadarPointColour:[UIColor whiteColor]];
        //[_arViewController setRadarRange:4000.0];
        [_arViewController setOnlyShowItemsWithinRadarRange:NO];
        //[_arViewController setModalTransitionStyle: UIModalTransitionStyleCrossDissolve];
        //[self presentModalViewController:_arViewController animated:YES];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration: 0.50];
        
        
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:YES];
        
        //Create ViewController
                
        [self.navigationController pushViewController:_arViewController animated:NO];
        _arViewController = nil;
        
        //Start Animation
        [UIView commitAnimations];
    }
    else
    {
        // Device not support
    }
}


- (NSMutableArray *)geoLocations
{    
    NSMutableArray *locationArray = [[NSMutableArray alloc] init];
    ARGeoCoordinate *tempCoordinate;
    CLLocation       *tempLocation;
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:39.550051 longitude:-105.782067];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Denver"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:45.523875 longitude:-122.670399];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Portland"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:41.879535 longitude:-87.624333];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Chicago"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:30.268735 longitude:-97.745209];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Austin"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:51.500152 longitude:-0.126236];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"London"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:48.856667 longitude:2.350987];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Paris"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:55.676294 longitude:12.568116];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Copenhagen"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:52.373801 longitude:4.890935];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Amsterdam"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:19.611544 longitude:-155.665283];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Hawaii"];
    tempCoordinate.inclination = M_PI/30;
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:40.756054 longitude:-73.986951];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"New York City"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:42.35892 longitude:-71.05781];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Boston"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:49.817492 longitude:15.472962];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Czech Republic"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:53.41291 longitude:-8.24389];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Ireland"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:38.892091 longitude:-77.024055];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Washington, DC"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:45.545447 longitude:-73.639076];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Montreal"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:32.78 longitude:-117.15];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"San Diego"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:-40.900557 longitude:174.885971];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Munich"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:33.5033333 longitude:-117.126611];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Temecula"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:19.26 longitude:-99.8];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Mexico City"];
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:53.566667 longitude:-113.516667];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Edmonton"];
    tempCoordinate.inclination = 0.5;
    [locationArray addObject:tempCoordinate];
    
    
    tempLocation = [[CLLocation alloc] initWithLatitude:47.620973 longitude:-122.347276];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Seattle"];
    [locationArray addObject:tempCoordinate];
    
    tempLocation = [[CLLocation alloc] initWithLatitude:50.461921 longitude:-3.525315];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Torquay"];
    [locationArray addObject:tempCoordinate];
    
    tempLocation = [[CLLocation alloc] initWithLatitude:50.43548 longitude:-3.561437];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Paignton"];
    [locationArray addObject:tempCoordinate];
    
    tempLocation = [[CLLocation alloc] initWithLatitude:50.394304 longitude:-3.513823];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Brixham"];
    [locationArray addObject:tempCoordinate];
    
    tempLocation = [[CLLocation alloc] initWithLatitude:50.4327 longitude:-3.686686];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Totnes"];
    [locationArray addObject:tempCoordinate];
    
    tempLocation = [[CLLocation alloc] initWithLatitude:50.458061 longitude:-3.597078];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Marldon"];
    [locationArray addObject:tempCoordinate];
    
    tempLocation = [[CLLocation alloc] initWithLatitude:50.528717 longitude:-3.606691];
    tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Newton Abbot"];
    [locationArray addObject:tempCoordinate];
    
    
    return locationArray;
}


- (void)locationClicked:(ARGeoCoordinate *)coordinate
{
    NSLog(@"%@", coordinate);
}

@end
