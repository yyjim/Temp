//
//  CMBBioView.m
//  MeetTheTeam
//
//  Created by Cathy Oun on 4/27/17.
//  Copyright © 2017 cathyoun. All rights reserved.
//

#import "CMBBioView.h"
#import "UIColor+CMBColor.h"

@implementation CMBBioView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, rect.size.width + 10, rect.origin.y + 85);
    CGContextAddLineToPoint(context, rect.size.width + 10, rect.size.height);
    CGContextAddLineToPoint(context, 0, rect.size.height);
    CGContextSetFillColorWithColor(context, [UIColor milkWhiteColor].CGColor);
    CGContextFillPath(context);
    
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor primaryColor].CGColor);
    CGContextSetLineWidth(context, 5);
    CGContextMoveToPoint(context, -10, 0);
    CGContextAddLineToPoint(context, rect.size.width + 10, rect.origin.y + 85);
    CGContextStrokePath(context);
}


@end
