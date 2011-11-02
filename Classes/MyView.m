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


CGFloat angleBetweenVectors(CGPoint o, CGPoint a, CGPoint b) {
	CGPoint t1;
	t1.x = a.x - o.x;
	t1.y = a.y - o.y;
	CGPoint t2;
	t2.x = b.x - o.x;
	t2.y = b.y - o.y;
	CGFloat result = (atan2(t1.y,t1.x) - atan2(t2.y, t2.x)) * 180.0 * M_1_PI;
	if(result < 0)
		result += 360.0;
	return result;
}



@implementation MyView

@synthesize stroke;



- (id)initWithFrame:(CGRect)aRect {
	self = [super initWithFrame:aRect];
	if (self) {
		[self setStroke:[NSMutableArray arrayWithCapacity: 100]];
	}
	return self;
}


-(void)setCursor:(CGPoint)c {
	cursor = c;
}


-(void)drawRect:(CGRect)rect {
	
	
	CGContextRef c = UIGraphicsGetCurrentContext();

//	UIDeviceOrientation o = [UIDevice currentDevice].orientation;
	
	
	CGRect r = [self bounds];
	CGFloat h = r.size.height-0.0;
//	CGFloat w = 60.0 * h / 120.0;
	CGFloat w = r.size.width-0.0;
	CGFloat uw = 60.0-12.0; 
	CGFloat uh = 120.0-20.0; 
	
	CGFloat x0 = 0.0;
	CGFloat x1  = x0 + w/uw * (12.0-6.0);
	CGFloat x1a = x1 - w/uw *  3.0;
	CGFloat x2  = x1 + w/uw *  4.5;
	CGFloat x3  = x2 + w/uw * 13.5;
	CGFloat x4  = x3 + w/uw * 13.5;
	CGFloat x5  = x4 + w/uw *  4.5;
	CGFloat x5a = x5 + w/uw *  3.0;
	CGFloat x6  = x5 + w/uw * (12.0-6.0);
	
	CGFloat y0 = 0.0;
	CGFloat y1 = y0 + h/uh * (21.0-10.0);
	CGFloat y2 = y1 + h/uh * 18.0;
	CGFloat y3 = y2 + h/uh * 21.0;
	CGFloat y4 = y3 + h/uh * 21.0;
	CGFloat y5 = y4 + h/uh * 18.0;
	CGFloat y6 = y5 + h/uh * (21.0-10.0);
	
	CGContextSetRGBFillColor(c, 78/256.0, 29/256.0, 144/256.0, 1.0);	
	CGContextAddRect(c,CGRectMake(x0,y0,x6-x0,y6-y0));
	CGContextFillPath(c);
	
	if ( CGRectContainsPoint(CGRectMake(x2,y1,x4-x2,y5-y1), cursor) ) {
		CGContextSetRGBFillColor(c, 8/256.0, 87/256.0, 22/256.0, 1.0);
	} else if ( CGRectContainsPoint(CGRectMake(x1,y1,x5-x1,y5-y1), cursor) ) {
		CGContextSetRGBFillColor(c, 8/256.0, 97/256.0, 22/256.0, 1.0);
	} else {
		CGContextSetRGBFillColor(c, 8/256.0, 107/256.0, 22/256.0, 1.0);
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
	

	CGPoint s = cursor;
	
	if ([stroke count] > 0) { 
		s = [[stroke objectAtIndex:0] CGPointValue];

		CGContextSetLineWidth(c, 0.25);
		CGContextMoveToPoint(c, s.x, s.y);
		for (NSValue *v in stroke) {
			CGPoint p = [v CGPointValue];
			CGContextAddLineToPoint(c, p.x, p.y);
		}
		CGContextStrokePath(c);

		CGContextSetLineWidth(c, 0.5);
		CGContextMoveToPoint(c, s.x-10, s.y-10);
		CGContextAddLineToPoint(c, s.x+10, s.y+10);
		CGContextMoveToPoint(c, s.x-10, s.y+10);
		CGContextAddLineToPoint(c, s.x+10, s.y-10);
		CGContextStrokePath(c);
	}
	
	if ( CGRectIntersectsRect( CGRectMake(cursor.x-20, cursor.y-20, 40, 40), CGRectMake(x0,y3,x6-x0,0) ) ) {
		CGContextSetRGBStrokeColor(c, 1.0, 0.0, 0.0, 1);
	} else {
		CGContextSetRGBStrokeColor(c, 1.0, 1.0, 0.0, 1);
	}
	CGContextSetLineWidth(c, 0.5);
	CGContextMoveToPoint(c, cursor.x-25, cursor.y-25);
	CGContextAddLineToPoint(c, cursor.x+25, cursor.y+25);
	CGContextMoveToPoint(c, cursor.x-25, cursor.y+25);
	CGContextAddLineToPoint(c, cursor.x+25, cursor.y-25);
	CGContextMoveToPoint(c, cursor.x, cursor.y);
	CGContextStrokePath(c);
//	CGContextStrokeEllipseInRect(c, CGRectMake(cursor.x-20, cursor.y-20, 40, 40));
	CGContextStrokePath(c);
	

	//return;
	
	
	CGFloat a1=0.0;
	CGFloat a2=0.0;
	
	if ([stroke count] >= 4) {
		CGPoint p0 = [[stroke objectAtIndex:0] CGPointValue];
		CGPoint p1 = [[stroke objectAtIndex:1] CGPointValue];
		CGPoint p2 = [[stroke objectAtIndex:[stroke count]-2] CGPointValue];
		CGPoint p3 = [[stroke objectAtIndex:[stroke count]-1] CGPointValue];
		
		a1 = angleBetweenVectors(p0,p3,p1);
		a2 = angleBetweenVectors(p3,p2,p0);
	}
	
	NSString* f1 = (a1>=0.0 && a1<180.0) ? @"BH" : @"FH";
	NSString* f2 = 
		(a1>=0.0 && a1<40.0 || a1<360.0 && a1>=320.0) ? @"VO" :
		( (a1>=40.0 && a1<60.0 || a1<320.0 && a1>=300.0) ? @"HV" :
			( (a1>=60.0 && a1<120.0 || a1<300.0 && a1>=240.0) ? @"  " :
				@"OV"
			)
		 );
		
	/*
	slice	flat	topspin	slice lob	topspin lob
	END 0..60	END 60..90	END 90..150	END 150
	
	ground	    volley	    half volley	overhead	
	BEG 60..120	BEG 0..45	BEG 45..60	BEG 120..180	
	*/
		
	
	CGContextTranslateCTM(c, 0, h);
	CGContextScaleCTM(c, 1, -1);
	
	CGAffineTransform t;
	CGContextSelectFont(c, "Courier", 20, kCGEncodingMacRoman);
	CGContextSetCharacterSpacing(c,0);
	CGContextSetTextDrawingMode(c, kCGTextFillStroke);
	CGContextSetRGBFillColor(c, 1, 1, 1, 1);
	CGContextSetRGBStrokeColor(c, 1, 1, 1, 1);
	CGContextSetLineWidth(c, 0.1);
	t =  CGAffineTransformMake(1,0,0,1,0,0);
	CGContextSetTextMatrix(c, t);
	
	//CGContextShowTextAtPoint(c, 43, 30, "MIDLAND PARK", 12);
	NSString* scount = [NSString stringWithFormat:@"%s %s|%d|%.0f|%.0f|%.2f|", 
						[f1 cStringUsingEncoding:NSUTF8StringEncoding], [f2 cStringUsingEncoding:NSUTF8StringEncoding], [stroke count], 
		/* (cursor.x)*uw/w, (cursor.y)*uh/h,*/
		a1, a2, sqrt( pow((cursor.x-s.x)*uw/w,2.0)+pow((cursor.y-s.y)*uh/h,2.0) )];
	CGContextShowTextAtPoint(c, 10, 25, [scount cStringUsingEncoding:NSUTF8StringEncoding], [scount length]);

	
}



@end

