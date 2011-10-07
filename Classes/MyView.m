#import "MyView.h"

@implementation UIView (FixedApi)

- (UIViewController *)viewController;
{
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else {
        return nil;
    }
}
@end


@implementation MyView


-(void)drawRect:(CGRect)rect
{
	CGContextRef c = UIGraphicsGetCurrentContext();

	UIDeviceOrientation o = [UIDevice currentDevice].orientation;
	switch (o) {
		case UIDeviceOrientationPortrait:
			CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
			break;
		case UIDeviceOrientationPortraitUpsideDown:
			CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 0.75);
			break;
		case UIDeviceOrientationLandscapeLeft:
			CGContextSetRGBFillColor(c, 1.0, 1.0, 0.0, 0.50);
			break;
		case UIDeviceOrientationLandscapeRight:
			CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 0.00);
			break;
		case UIDeviceOrientationFaceUp:
		case UIDeviceOrientationFaceDown:
		default:
			CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 0.5);
			break;
	}
	
	CGContextSetLineWidth(c, 0.5);
	CGContextSetRGBStrokeColor(c, 1.0, 1.0, 0.0, 1.0);
	CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 0.5);
	
//	CGContextAddRect(c,rect);
//	CGContextFillPath(c);
//	CGContextAddRect(c,rect);
//	CGContextStrokePath(c);

	CGContextSetRGBStrokeColor(c, 0.0, 1.0, 0.0, 1.0);
		
	CGContextMoveToPoint(c, 10.0, 30.0);
	CGContextAddLineToPoint(c, 310.0, 30.0);
	
	CGContextStrokePath(c);
	
	CGPoint addLines[] =
	{
		CGPointMake(10.0, 90.0),
		CGPointMake(70.0, 60.0),
		CGPointMake(130.0, 90.0),
		CGPointMake(190.0, 60.0),
		CGPointMake(250.0, 90.0),
		CGPointMake(310.0, 60.0),
	};
	// Bulk call to add lines to the current path.
	// Equivalent to MoveToPoint(points[0]); for(i=1; i<count; ++i) AddLineToPoint(points[i]);
	CGContextAddLines(c, addLines, sizeof(addLines)/sizeof(addLines[0]));
	CGContextStrokePath(c);
	
	// Draw a series of line segments. Each pair of points is a segment
	CGPoint strokeSegments[] =
	{
		CGPointMake(10.0, 150.0),
		CGPointMake(70.0, 120.0),
		CGPointMake(130.0, 150.0),
		CGPointMake(190.0, 120.0),
		CGPointMake(250.0, 150.0),
		CGPointMake(310.0, 120.0),
	};
	// Bulk call to stroke a sequence of line segments.
	// Equivalent to for(i=0; i<count; i+=2) { MoveToPoint(point[i]); AddLineToPoint(point[i+1]); StrokePath(); }
	CGContextStrokeLineSegments(c, strokeSegments, sizeof(strokeSegments)/sizeof(strokeSegments[0]));
	
	
	CGFloat w, h;
	w = rect.size.width;
	h = rect.size.height;
		
	
	
	CGContextTranslateCTM(c, 0, h);
	CGContextScaleCTM(c, 1, -1);
	
	CGAffineTransform t;
	CGContextSelectFont(c, "Helvetica-Bold", 70, kCGEncodingMacRoman);
	CGContextSetCharacterSpacing(c,0);
	CGContextSetTextDrawingMode(c, kCGTextFillStroke);
	CGContextSetRGBFillColor(c, 1, 1, 0, 1);
	CGContextSetRGBStrokeColor(c, 1, 1, 0, 1);
	CGContextSetLineWidth(c, 1.0);

	t =  CGAffineTransformMake(1,0,0,1,0,0);
	CGContextSetTextMatrix(c, t);
	CGContextShowTextAtPoint(c, 30, 30, "TENNIS", 6);
}

@end

