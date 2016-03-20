//
//  UIView+CRView.m
//  CRNote
//
//  Created by caine on 12/20/15.
//  Copyright © 2015 com.caine. All rights reserved.
//

#import "UIView+XUIView.h"

@implementation UIView(XUIView)

- (void)letShadowWithPath:(CGPathRef)path size:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowPath = path;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
}

- (void)letShadowWithSize:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
}

@end
