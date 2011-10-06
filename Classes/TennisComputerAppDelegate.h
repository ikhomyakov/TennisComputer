@class MyViewController;

@interface TennisComputerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MyViewController *controller;
}


@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MyViewController *controller;

@end



