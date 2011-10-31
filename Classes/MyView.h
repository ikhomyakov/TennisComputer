@interface UIView (FixedApi)
- (UIViewController *)viewController;
@end

@interface MyView : UIView {
	CGPoint cursor;
	NSMutableArray* stroke;
}

@property (nonatomic, retain) NSMutableArray* stroke;

-(id)initWithFrame:(CGRect)aRect;
-(void)setCursor:(CGPoint)c;

@end


