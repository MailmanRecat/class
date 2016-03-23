//
//  CRFloatingButton.m
//  CRNote
//
//  Created by caine on 12/30/15.
//  Copyright © 2015 com.caine. All rights reserved.
//

#import "XUIFloatingButton.h"
#import "UIView+XUIView.h"

@implementation XUIFloatingButton

- (instancetype)initFromFont:(UIFont *)font title:(NSString *)title
{
    self = [super init];
    if( self )
    {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithWhite:1 alpha:0.7] forState:UIControlStateHighlighted];
        [self letShadowWithSize:CGSizeMake(0, 1.7) opacity:0.3f radius:1.7];
        [self.titleLabel setFont:font];
        
        [self UI:56.0f];
    }
    return self;
}

- (instancetype)init40FromFont:(UIFont *)font title:(NSString *)title
{
    self = [super init];
    if( self )
    {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithWhite:1 alpha:0.7] forState:UIControlStateHighlighted];
        [self letShadowWithSize:CGSizeMake(0, 1.7) opacity:0.3f radius:1.7];
        [self.titleLabel setFont:font];
        
        [self UI:40.0f];
    }
    return self;
}

- (void)UI:(CGFloat)size
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.widthAnchor constraintEqualToConstant:size].active = YES;
    [self.heightAnchor constraintEqualToAnchor:self.widthAnchor].active = YES;
    
    self.layer.cornerRadius = size / 2.0f;
}

@end
