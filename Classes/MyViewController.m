#import "MyViewController.h"
#import "MyView.h"
#import "UIColorHex.h"

@implementation MyViewController

@synthesize motionManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		[self setWantsFullScreenLayout:NO];
	}
	return self;
}


- (id)makeLabel:(NSString *)title withColor:(UIColor *)color frame:(CGRect)rect {
	UILabel *v1 = [[[UILabel alloc] initWithFrame:rect] autorelease];
	[v1 setText:title];
	[v1 setBackgroundColor:color];
	[v1 setTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
	[v1 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
	[v1 setTextAlignment:UITextAlignmentCenter];
	[v1 setNumberOfLines:2];
	return v1;
}


- (void)loadView {
	NSLog(@"=== MyViewController.loadView");

    MyView *v = [[MyView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//	[v setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2]];
	[v setMultipleTouchEnabled:YES];
	[v setClearsContextBeforeDrawing:NO]; 
	[v setOpaque:YES];
	[v setContentMode:UIViewContentModeTopLeft];
	
	
	UIView *v1;
	
	v1 = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[v1 addSubview:[self makeLabel:@"first serve" withColor:[UIColor colorWithHex:@"000000" alpha:1] frame:CGRectMake(4,4,304,20)]];
	[v1 addSubview:[self makeLabel:@"ace" withColor:[UIColor colorWithHex:@"AA3280" alpha:1] frame:CGRectMake(4,28,150,100)]];
	[v1 addSubview:[self makeLabel:@"not returned" withColor:[UIColor colorWithHex:@"803C68" alpha:1] frame:CGRectMake(4,132,150,100)]];
	[v1 addSubview:[self makeLabel:@"returned" withColor:[UIColor colorWithHex:@"6F104E" alpha:1] frame:CGRectMake(4,236,150,100)]];
	[v1 addSubview:[self makeLabel:@"fault net" withColor:[UIColor colorWithHex:@"D564AD" alpha:1] frame:CGRectMake(158,28,150,100)]];
	[v1 addSubview:[self makeLabel:@"fault long" withColor:[UIColor colorWithHex:@"D582B8" alpha:1] frame:CGRectMake(158,132,150,100)]];
	[v1 addSubview:[self makeLabel:@"fault wide" withColor:[UIColor colorWithHex:@"5D314D" alpha:1] frame:CGRectMake(158,236,150,100)]];
	[v addSubview:v1];
	[v1 setHidden:NO];
	[v1 release];
	
	v1 = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[v1 addSubview:[self makeLabel:@"second serve" withColor:[UIColor colorWithHex:@"000000" alpha:1] frame:CGRectMake(4,4,304,20)]];
	[v1 addSubview:[self makeLabel:@"ace" withColor:[UIColor colorWithHex:@"6A1E98" alpha:1] frame:CGRectMake(4,28,150,100)]];
	[v1 addSubview:[self makeLabel:@"not returned" withColor:[UIColor colorWithHex:@"582D72" alpha:1] frame:CGRectMake(4,132,150,100)]];
	[v1 addSubview:[self makeLabel:@"returned" withColor:[UIColor colorWithHex:@"420A63" alpha:1] frame:CGRectMake(4,236,150,100)]];
	[v1 addSubview:[self makeLabel:@"fault net" withColor:[UIColor colorWithHex:@"9E51CB" alpha:1] frame:CGRectMake(158,28,150,100)]];
	[v1 addSubview:[self makeLabel:@"fault long" withColor:[UIColor colorWithHex:@"AA72CB" alpha:1] frame:CGRectMake(158,132,150,100)]];
	[v1 addSubview:[self makeLabel:@"fault wide" withColor:[UIColor colorWithHex:@"4A2C5C" alpha:1] frame:CGRectMake(158,236,150,100)]];
	[v addSubview:v1];
	[v1 setHidden:NO];
	[v1 release];
	
	/*
	UIButton *v2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[v2 setFrame:CGRectMake(10, 40, 100, 100)];
	[v2 setTitle:@"ACE" forState:UIControlStateNormal];
	[v2 setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:1]];
//	[v2 setUserInteractionEnabled:YES];
	[v addSubview:v2];
	[v2 release];
	 */
		
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
