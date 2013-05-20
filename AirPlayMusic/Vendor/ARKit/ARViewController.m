//
//  ARViewController.m
//  ARKitDemo
//
//  Modified by Niels W Hansen on 12/31/11.
//  Modified by Ed Rackham (a1phanumeric) 2013
//

#import "ARViewController.h"
#import "AugmentedRealityController.h"
#import "GEOLocations.h"
#import "MarkerView.h"

@implementation ARViewController
{
    AugmentedRealityController *_agController;
}

@synthesize delegate;

- (id)initWithDelegate:(id<ARLocationDelegate>)aDelegate
{
	
	[self setDelegate:aDelegate];
	
	if (!(self = [super init]))
    {
		return self;
	}
    
	[self setWantsFullScreenLayout:NO];
    
    // Defaults
    _debugMode                      = NO;
    _scaleViewsBasedOnDistance      = YES;
    _minimumScaleFactor             = 0.5;
    _rotateViewsBasedOnPerspective  = YES;
    _showsRadar                     = YES;
    _showsCloseButton               = YES;
    _radarRange                     = 20.0;
    _onlyShowItemsWithinRadarRange  = NO;
    
    // Create ARC
    _agController = [[AugmentedRealityController alloc] initWithViewController:self withDelgate:self];
	
    [_agController setShowsRadar:_showsRadar];
    [_agController setRadarRange:_radarRange];
	[_agController setScaleViewsBasedOnDistance:_scaleViewsBasedOnDistance];
	[_agController setMinimumScaleFactor:_minimumScaleFactor];
	[_agController setRotateViewsBasedOnPerspective:_rotateViewsBasedOnPerspective];
    [_agController setOnlyShowItemsWithinRadarRange:_onlyShowItemsWithinRadarRange];
    
    GEOLocations *locations = [[GEOLocations alloc] initWithDelegate:delegate];
	
	if([[locations returnLocations] count] > 0)
    {
		for (ARGeoCoordinate *coordinate in [locations returnLocations])
        {
			MarkerView *cv = [[MarkerView alloc] initForCoordinate:coordinate withDelgate:self allowsCallout:YES];
            [coordinate setDisplayView:cv];
			[_agController addCoordinate:coordinate];
		}
	}
    
    [self.view setAutoresizesSubviews:YES];
    
    [UIAppDelegate showMainMenu];
    if(_showsCloseButton == YES)
    {
        UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 74, 47)];
        
        [closeBtn setTitle:@"Close" forState:UIControlStateNormal];
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"closeios.png"] forState:UIControlStateNormal];
        [closeBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
        [closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [closeBtn.titleLabel setShadowColor:[UIColor colorWithWhite:0.1 alpha:1.0]];
        [closeBtn.titleLabel setShadowOffset:CGSizeMake(0, -1)];
        [closeBtn setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:1.0]];
        [closeBtn addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        closeBtn.titleEdgeInsets = UIEdgeInsetsMake(23, 0, 0, 0);
        [[self view] addSubview:closeBtn];
        
        CGRect rect = closeBtn.frame;
        rect.origin.x = [UIScreen mainScreen].bounds.size.height - closeBtn.frame.size.width;
        rect.origin.y = [UIScreen mainScreen].bounds.size.width - closeBtn.frame.size.height;
        closeBtn.frame = rect;
    }
    
    //
    // add tracker
    // control
    //
    UIImageView *trackImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"songTargetios.png"]];
    trackImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.height/2 - 34, [UIScreen mainScreen].bounds.size.width/2 - 34, 68, 68);
    [self.view addSubview:trackImageView];
    return self;
}

- (void)closeButtonClicked:(id)sender
{
    _agController = nil;
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    [UIView  beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.375];
    [self.navigationController popViewControllerAnimated:NO];
    [UIView commitAnimations];
    
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)didTapMarker:(ARGeoCoordinate *)coordinate
{
    NSLog(@"delegate worked click on %@", [coordinate title]);
    [delegate locationClicked:coordinate];    
}

- (void)didUpdateHeading:(CLHeading *)newHeading
{
    //NSLog(@"Heading Updated");
}
- (void)didUpdateLocation:(CLLocation *)newLocation
{
    //NSLog(@"Location Updated");
}
- (void)didUpdateOrientation:(UIDeviceOrientation)orientation
{
   /*NSLog(@"Orientation Updated");
    
    if(orientation == UIDeviceOrientationPortrait)
        NSLog(@"Portrait");
    */
}

#pragma mark - Custom Setters
- (void)setDebugMode:(BOOL)debugMode
{
    _debugMode = debugMode;
    [_agController setDebugMode:_debugMode];
}

- (void)setShowsRadar:(BOOL)showsRadar
{
    _showsRadar = showsRadar;
    [_agController setShowsRadar:_showsRadar];
}

- (void)setScaleViewsBasedOnDistance:(BOOL)scaleViewsBasedOnDistance
{
    _scaleViewsBasedOnDistance = scaleViewsBasedOnDistance;
    [_agController setScaleViewsBasedOnDistance:_scaleViewsBasedOnDistance];
}

- (void)setMinimumScaleFactor:(float)minimumScaleFactor
{
    _minimumScaleFactor = minimumScaleFactor;
    [_agController setMinimumScaleFactor:_minimumScaleFactor];
}

- (void)setRotateViewsBasedOnPerspective:(BOOL)rotateViewsBasedOnPerspective
{
    _rotateViewsBasedOnPerspective = rotateViewsBasedOnPerspective;
    [_agController setRotateViewsBasedOnPerspective:_rotateViewsBasedOnPerspective];
}

- (void)setRadarPointColour:(UIColor *)radarPointColour
{
    _radarPointColour = radarPointColour;
    [_agController.radarView setPointColour:_radarPointColour];
}

- (void)setRadarBackgroundColour:(UIColor *)radarBackgroundColour
{
    _radarBackgroundColour = radarBackgroundColour;
    [_agController.radarView setRadarBackgroundColour:_radarBackgroundColour];
}

- (void)setRadarViewportColour:(UIColor *)radarViewportColour
{
    _radarViewportColour = radarViewportColour;
    [_agController.radarViewPort setViewportColour:_radarViewportColour];
}

- (void)setRadarRange:(float)radarRange
{
    _radarRange = radarRange;
    [_agController setRadarRange:_radarRange];
}

- (void)setOnlyShowItemsWithinRadarRange:(BOOL)onlyShowItemsWithinRadarRange
{
    _onlyShowItemsWithinRadarRange = onlyShowItemsWithinRadarRange;
    [_agController setOnlyShowItemsWithinRadarRange:_onlyShowItemsWithinRadarRange];
}


#pragma mark - View Cleanup
- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
	_agController = nil;
}

@end
