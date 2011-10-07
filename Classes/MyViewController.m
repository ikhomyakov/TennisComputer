#import "MyViewController.h"
#import "MyView.h"

@implementation MyViewController

@synthesize motionManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		[self setWantsFullScreenLayout:NO];
	}
	return self;
}

- (void)loadView {
	NSLog(@"=== MyViewController.loadView");

    MyView *v = [[MyView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//	[v setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2]]; 
	[self setView:v];
    [v release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	 NSLog(@"=== MyViewController.viewDidLoad");
	 [super viewDidLoad];
	 
	 [self setMotionManager:[[CMMotionManager alloc] init]];
	 motionManager.gyroUpdateInterval = 1.0/1.0;
	 if (motionManager.gyroAvailable && NO) {		 
		 [motionManager startGyroUpdatesToQueue: [[NSOperationQueue currentQueue] retain] withHandler: ^ (CMGyroData *gyroData, NSError *error) {
			 CMRotationRate r = gyroData.rotationRate;
			 NSLog(@"=== CMGyro: x=%f, y=%f, z=%f",r.x, r.y, r.z);
		 } ];
	 } else {
		 NSLog(@"No gyroscope on device.");
	 }

	if (motionManager.accelerometerAvailable) {
		motionManager.accelerometerUpdateInterval = 1.0/60.0;
		[motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue currentQueue] retain] withHandler: ^ (CMAccelerometerData *acceData, NSError *error) {
			CMAcceleration a = acceData.acceleration;
			NSLog(@"=== CMAcce: x=%f, y=%f, z=%f",a.x, a.y, a.z);
		} ];
	} else {
		NSLog(@"No accelerometer on device.");
	}

	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	NSLog(@"=== MyViewController.shouldAutorotateToInterfaceOrientation");
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
//	return YES;
}

- (void)didReceiveMemoryWarning {
	NSLog(@"=== MyViewController.didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	NSLog(@"=== MyViewController.viewDidUnload");
	[motionManager release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[motionManager release];
    [super dealloc];
}


@end
