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
	[v setMultipleTouchEnabled:YES];
	[v setClearsContextBeforeDrawing:NO]; 
	[v setOpaque:YES];
	[v setContentMode:UIViewContentModeTopLeft];

	[self setView:v];
    [v release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	 NSLog(@"=== MyViewController.viewDidLoad");
	 [super viewDidLoad];
	 
/*
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
*/
 
	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	NSLog(@"=== MyViewController.shouldAutorotateToInterfaceOrientation");
//	return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
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
//	[motionManager release];
    [super dealloc];
}




-(void)logTouches:(NSSet *)touches withEvent:(UIEvent *)event andLabel:(NSString *)label
{
	NSLog(@"Touches ===%@=== #touches=%d, Event touches: all=%d, win=%d, view=%d <<<", 
		  label, [touches count], [[event allTouches] count], 
		  [[event touchesForWindow:[[self view] window]] count], [[event touchesForView:[self view]] count]);
	for (UITouch *touch in touches) {
		CGPoint p = [touch previousLocationInView:[self view]];
		CGPoint c = [touch locationInView:[self view]];
		NSLog(@" id=%X, phase=%d, locationInView=(%f,%f), previousLocationInView=(%f,%f), tapCount=%d, timestamp=%f", 
			  touch, [touch phase], c.x, c.y, p.x, p.y, [touch tapCount], [touch timestamp] );
	}
	NSLog(@">>>");
}

// Handles the start of a touch
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self logTouches:touches withEvent:event andLabel:@"BEGAN"];
}


// Handles the continuation of a touch.
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{  
	[self logTouches:touches withEvent:event andLabel:@"MOVED"];
}

// Handles the end of a touch event.
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self logTouches:touches withEvent:event andLabel:@"ENDED"];

	
	if ([touches count] == [[event touchesForView:[self view]] count]) {
		NSLog(@"- - - - - - - - - - - - - - - - - - - - - SEQUENCE HAS ENDED - - - - - - - - - - - - - - - - - - - - - -");
	}
	
	/*
	[self view].userInteractionEnabled = NO;

	CGPoint p = [[touches anyObject] locationInView:[self view]];
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    CGAffineTransform t = CGAffineTransformMakeTranslation(p.x,p.y);
    [self view].transform = t;
    [UIView commitAnimations];
	 */
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self logTouches:touches withEvent:event andLabel:@"CANCELLED"];
}


@end
