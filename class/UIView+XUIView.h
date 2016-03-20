//
//  UIView+CRView.h
//  CRNote
//
//  Created by caine on 12/20/15.
//  Copyright © 2015 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(XUIView)

- (void)letShadowWithSize:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;
- (void)letShadowWithPath:(CGPathRef)path size:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;

@end
