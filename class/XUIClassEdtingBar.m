//
//  XUIClassEdtingBar.m
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XUIClassEdtingBar.h"
#import "UIFont+MaterialDesignIcons.h"

@interface XUIClassEdtingBar()

@property( nonatomic, strong ) UIStackView *stackView;
@property( nonatomic, strong ) UIView      *stackIndicator;

@end

@implementation XUIClassEdtingBar

- (instancetype)init
{
    self = [super init];
    if( self )
    {
        [self UI];
    }
    return self;
}

- (void)UI
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.heightAnchor constraintEqualToConstant:76.0f].active = YES;
    
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

    self.leftBarItem = ({
        UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 56, 56)];
        b.titleLabel.font = [UIFont MaterialDesignIcons];
        [self.contentView addSubview:b];
        [b setTitle:[UIFont mdiArrowLeft] forState:UIControlStateNormal];
        [b setTitleColor:self.tintColor forState:UIControlStateNormal];
        b;
    });
    
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:199 / 255.0 blue:204 / 255.0 alpha:1];
    border.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:border];
    [border.heightAnchor constraintEqualToConstant:0.5].active = YES;
    [border.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [border.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [border.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    
//    NSArray *weekdays = @[ @"S", @"M", @"T", @"W", @"T", @"F", @"S" ];
//    
//    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:({
//        __block NSMutableArray<__kindof UIView *> *labels = [NSMutableArray array];
//        [weekdays enumerateObjectsUsingBlock:^(NSString *day, NSUInteger index, BOOL *sS){
//            UILabel *l = [[UILabel alloc] init];
//            l.textColor = self.tintColor;
//            l.text = day;
//            l.textAlignment = NSTextAlignmentCenter;
//            [labels addObject:l];
//        }];
//        labels;
//    })];
//    self.stackView.alignment = UIStackViewAlignmentCenter;
//    self.stackView.axis = UILayoutConstraintAxisHorizontal;
//    self.stackView.spacing = .0f;
//    self.stackView.distribution = UIStackViewDistributionFillEqually;
//    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    [self.contentView addSubview:self.stackView];
//    [self.stackView.heightAnchor constraintEqualToConstant:42].active = YES;
//    [self.stackView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8].active = YES;
//    [self.stackView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-8].active = YES;
//    [self.stackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
//    
//    self.stackIndicator = [[UIView alloc] init];
//    self.stackIndicator.translatesAutoresizingMaskIntoConstraints = NO;
//    self.stackIndicator.backgroundColor = self.tintColor;
//    
//    [self.stackView addSubview:self.stackIndicator];
//    [self.stackIndicator.widthAnchor constraintEqualToAnchor:self.stackView.widthAnchor multiplier:1.0 / weekdays.count].active = YES;
//    [self.stackIndicator.leftAnchor constraintEqualToAnchor:self.stackView.leftAnchor constant:0].active = YES;
//    [self.stackIndicator.bottomAnchor constraintEqualToAnchor:self.stackView.bottomAnchor].active = YES;
//    [self.stackIndicator.heightAnchor constraintEqualToConstant:2.0f].active = YES;
}

@end
