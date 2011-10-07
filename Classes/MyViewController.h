@interface MyViewController : UIViewController {
	CMMotionManager *motionManager;
}

@property (nonatomic, retain) CMMotionManager *motionManager;

-(void)logTouches:(NSSet *)touches withEvent:(UIEvent *)event andLabel:(NSString *)label;

@end
