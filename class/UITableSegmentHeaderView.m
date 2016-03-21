//
//  UITableSegmentHeaderView.m
//  class
//
//  Created by caine on 3/22/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "UITableSegmentHeaderView.h"

@implementation UITableSegmentHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if( self )
    {
        [self UI];
    }
    return self;
}

- (void)UI
{
    self.segmentControl = ({
        UISegmentedControl *f = [[UISegmentedControl alloc] initWithItems:@[ @"S", @"M", @"T", @"W", @"T", @"F", @"S" ]];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:f];
        [f.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
        [f.widthAnchor constraintEqualToAnchor:self.widthAnchor constant:-16].active = YES;
        [f.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
        f;
    });
}

@end
