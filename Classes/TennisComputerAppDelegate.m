#import "TennisComputerAppDelegate.h"
#import "MyViewController.h"
#import "UIKit/UIColor.h"

@implementation TennisComputerAppDelegate

@synthesize window;
@synthesize controller;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	NSLog(@"=== TennisComputerAppDelegate.applicationDidFinishLaunching");

    UIWindow *w = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[self setWindow:w];
	[w release];
	
	MyViewController* c = [[MyViewController alloc] initWithNibName:nil bundle:nil];
	[window setRootViewController:c];
	[self setController:c];
	[c release];

	[window makeKeyAndVisible];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	NSLog(@"=== TennisComputerAppDelegate.applicationDidEnterBackground");

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
	NSLog(@"=== TennisComputerAppDelegate.applicationWillEnterForeground");

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	NSLog(@"=== TennisComputerAppDelegate.applicationWillTerminate");

}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
	NSLog(@"=== TennisComputerAppDelegate.applicationDidReceiveMemoryWarning");

}


- (void)dealloc {
	[window release];
	[controller release];
    [super dealloc];
}


@end
