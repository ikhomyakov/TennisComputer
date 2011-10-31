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

-(void)setCursor:(CGPoint)c {
	cursor = c;
}


-(void)drawRect:(CGRect)rect {
	
	
	CGContextRef c = UIGraphicsGetCurrentContext();

//	UIDeviceOrientation o = [UIDevice currentDevice].orientation;
	
	
	CGRect r = [self bounds];
	CGFloat h = r.size.height-1.0;
//	CGFloat w = 60.0 * h / 120.0;
	CGFloat w = r.size.width-1.0;
	
	CGFloat x0 = 0.5;
	CGFloat x1  = x0 + w/60.0 * 12.0;
	CGFloat x1a = x1 - w/60.0 *  3.0;
	CGFloat x2  = x1 + w/60.0 *  4.5;
	CGFloat x3  = x2 + w/60.0 * 13.5;
	CGFloat x4  = x3 + w/60.0 * 13.5;
	CGFloat x5  = x4 + w/60.0 *  4.5;
	CGFloat x5a = x5 + w/60.0 *  3.0;
	CGFloat x6  = x5 + w/60.0 * 12.0;
	
	CGFloat y0 = 0.5;
	CGFloat y1 = y0 + h/120.0 * 21.0;
	CGFloat y2 = y1 + h/120.0 * 18.0;
	CGFloat y3 = y2 + h/120.0 * 21.0;
	CGFloat y4 = y3 + h/120.0 * 21.0;
	CGFloat y5 = y4 + h/120.0 * 18.0;
	CGFloat y6 = y5 + h/120.0 * 21.0;
	
	CGContextSetRGBFillColor(c, 78/256.0, 29/256.0, 144/256.0, 1.0);	
	CGContextAddRect(c,CGRectMake(x0,y0,x6-x0,y6-y0));
	CGContextFillPath(c);
	
	if ( CGRectContainsPoint(CGRectMake(x2,y1,x4-x2,y5-y1), cursor) ) {
		CGContextSetRGBFillColor(c, 8/256.0, 87/256.0, 22/256.0, 1.0);
	} else if ( CGRectContainsPoint(CGRectMake(x1,y1,x5-x1,y5-y1), cursor) ) {
		CGContextSetRGBFillColor(c, 118/256.0, 87/256.0, 22/256.0, 1.0);
	} else {
		CGContextSetRGBFillColor(c, 218/256.0, 87/256.0, 22/256.0, 1.0);
	}
	CGContextAddRect(c,CGRectMake(x1,y1,x5-x1,y5-y1));
	CGContextFillPath(c);

	CGContextSetLineWidth(c, 1.0);
	CGContextSetRGBStrokeColor(c, 1.0, 1.0, 1.0, 1.0);
	CGContextMoveToPoint(c, x1, y1);
	CGContextAddLineToPoint(c, x5, y1);
	CGContextAddLineToPoint(c, x5, y5);
	CGContextAddLineToPoint(c, x1, y5);
	CGContextAddLineToPoint(c, x1, y1);
	CGContextMoveToPoint(c, x2, y1);
	CGContextAddLineToPoint(c, x2, y5);
	CGContextMoveToPoint(c, x4, y1);
	CGContextAddLineToPoint(c, x4, y5);
	CGContextMoveToPoint(c, x3, y2);
	CGContextAddLineToPoint(c, x3, y4);
	CGContextMoveToPoint(c, x2, y2);
	CGContextAddLineToPoint(c, x4, y2);
	CGContextMoveToPoint(c, x2, y4);
	CGContextAddLineToPoint(c, x4, y4);
	CGContextMoveToPoint(c, x3, y1);
	CGContextAddLineToPoint(c, x3, y1+4);
	CGContextMoveToPoint(c, x3, y5);
	CGContextAddLineToPoint(c, x3, y5-4);
	CGContextStrokePath(c);

	CGContextSetLineWidth(c, 2.0);
	CGContextMoveToPoint(c, x1a, y3);
	CGContextAddLineToPoint(c, x5a, y3);
	CGContextStrokePath(c);
	
	CGContextSetLineWidth(c, 0.5);
	CGContextMoveToPoint(c, cursor.x-20, cursor.y-20);
	CGContextAddLineToPoint(c, cursor.x+20, cursor.y+20);
	CGContextMoveToPoint(c, cursor.x-20, cursor.y+20);
	CGContextAddLineToPoint(c, cursor.x+20, cursor.y-20);
	CGContextStrokePath(c);
	

	return;
	
	/*
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
	 */
}



@end

