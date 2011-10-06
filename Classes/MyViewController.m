#import "MyViewController.h"
#import "MyView.h"

@implementation MyViewController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */

- (void)loadView {
	NSLog(@"=== MyViewController.loadView");

//	self.wantsFullScreenLayout = YES;
    MyView *v = [[MyView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[v setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2]]; 
	[self setView:v];
    [v release];
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	 NSLog(@"=== MyViewController.viewDidLoad");
	 [super viewDidLoad];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
