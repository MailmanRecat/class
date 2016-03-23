//
//  XUIBar.h
//  class
//
//  Created by caine on 3/23/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XUIBarBack)
{
    XUIBarBackClose = 0,
    XUIBarBackArrow
};

@interface XUIBar : UIView

@property( nonatomic, strong ) UIView                   *contentView;
@property( nonatomic, strong ) UIButton                 *leftItem;
@property( nonatomic, strong ) UILabel                  *titleLabel;

- (instancetype)initWithBack:(XUIBarBack)back;

@end
