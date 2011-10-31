@interface UIView (FixedApi)
- (UIViewController *)viewController;
@end

@interface MyView : UIView {
	CGPoint cursor;
}

-(void)setCursor:(CGPoint)c;

@end


