@interface UIView (FixedApi)
- (UIViewController *)viewController;
@end


@interface MyView : UIView {
	CGPoint cursor;
	NSMutableArray* stroke;
	
	CMRotationRate rotationRate;
	NSTimeInterval rotationRateTimestamp;

	CMAcceleration acceleration;
	NSTimeInterval accelerationTimestamp;

	double maxRotationRate;
	double maxAcceleration;
	double minRotationRate;
	double minAcceleration;

}

@property (nonatomic, retain) NSMutableArray* stroke;

-(id)initWithFrame:(CGRect)aRect;
-(void)setCursor:(CGPoint)c;

-(void)setRotationRate:(CMRotationRate)r;
-(CMRotationRate)rotationRate;

-(void)setAcceleration:(CMAcceleration)r;
-(CMAcceleration)acceleration;

@end


