#import "UIColorHex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHex:(NSString *)hex alpha:(CGFloat) alpha {	
	unsigned int r,g,b;
	sscanf([hex UTF8String],"%2X%2X%2X",&r,&g,&b);
	return [UIColor colorWithRed:r/256.0 green:g/256.0 blue:b/256.0 alpha:alpha];
}



@end
