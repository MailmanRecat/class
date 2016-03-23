//
//  XUIBar.m
//  class
//
//  Created by caine on 3/23/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XUIBar.h"
#import "UIFont+MaterialDesignIcons.h"

@interface XUIBar()

@property( nonatomic, assign ) XUIBarBack                   backType;

@end

@implementation XUIBar

- (instancetype)initWithBack:(XUIBarBack)back
{
    self = [super init];
    if( self )
    {
        [self setBackType:back];
        [self UI];
    }
    return self;
}

- (void)UI
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentView = ({
        UIView *f = [UIView new];
        [f setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.topAnchor constant:[UIApplication sharedApplication].statusBarFrame.size.height].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        f;
    });
    self.leftItem = ({
        UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(16, 0, 56, 56)];
        [self.contentView addSubview:b];
        [b setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [b.titleLabel setFont:[UIFont MaterialDesignIcons]];
        [b setTitleColor:self.tintColor forState:UIControlStateNormal];
        [b setTitle:self.backType == XUIBarBackClose ? [UIFont mdiClose] : [UIFont mdiArrowLeft] forState:UIControlStateNormal];
        b;
    });
    self.titleLabel = ({
        UILabel *l = [[UILabel alloc] init];
        l.font = [UIFont systemFontOfSize:20];
        l.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:l];
        [l.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [l.leftAnchor constraintEqualToAnchor:self.leftItem.rightAnchor].active = YES;
        [l.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
        [l.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        l;
    });
}

@end
