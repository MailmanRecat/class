//
//  XUIClassBar.m
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XUIClassBar.h"
#import "UIView+XUIView.h"
#import "UIFont+MaterialDesignIcons.h"

@interface XUIClassBar()

@property( nonatomic, strong ) UIStackView                      *stackView;
@property( nonatomic, strong ) UIView                           *stackIndicator;
@property( nonatomic, strong ) NSLayoutConstraint               *stackIndicatorGuide;

@end

@implementation XUIClassBar

- (instancetype)init
{
    self = [super init];
    if( self )
    {
        [self setTintColor:[UIColor colorWithRed:0 green:153 / 255.0 blue:153 / 255.0 alpha:1]];
        [self UI];
    }
    return self;
}

- (void)toggle:(UIButton *)button
{
    [self indicatorToPosition:button.tag - 1000 animation:YES];
}

- (void)indicatorToPosition:(NSUInteger)position animation:(BOOL)animation
{
    if( position > 6 ) return;
    
    self.stackIndicatorGuide.constant = position * (self.stackView.frame.size.width / 7.0);
    [UIView animateWithDuration:animation ? .25f : .0f delay:.0f options:( 7 << 16 )
                     animations:^{
                         [self.stackView layoutIfNeeded];
                     }completion:^(BOOL f){
                         
                     }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)UI
{
    [self letShadowWithSize:CGSizeMake(0, 3) opacity:.27f radius:3.0f];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.heightAnchor constraintEqualToConstant:118.0f].active = YES;
    
    self.backgroundColor = self.tintColor;
    
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
    
    self.tf = ({
        UITextField *f = [UITextField new];
        f.backgroundColor = [UIColor whiteColor];
        f.leftView.backgroundColor = [UIColor whiteColor];
        f.leftViewMode = UITextFieldViewModeAlways;
        f.rightViewMode = UITextFieldViewModeAlways;
        f.clearButtonMode = UITextFieldViewModeWhileEditing;
        f.leftView = ({
            UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
            [b.titleLabel setFont:[UIFont MaterialDesignIcons]];
            [b setTitleColor:self.tintColor forState:UIControlStateNormal];
            [b setTitle:[UIFont mdiMagnify] forState:UIControlStateNormal];
            b;
        });
        f.layer.cornerRadius = 4.0f;
        f.borderStyle = UITextBorderStyleNone;
        f.layer.shadowColor = [UIColor blackColor].CGColor;
        f.layer.shadowOffset = CGSizeMake(0, 1);
        f.layer.shadowOpacity = .27f;
        f.layer.shadowRadius = 1.7;
        [f setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:6].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-8].active = YES;
        [f.heightAnchor constraintEqualToConstant:44.0f].active = YES;
        f;
    });
    
    self.leftBarItem = (UIButton *)self.tf.leftView;
    
    NSArray *weekdays = @[ @"S", @"M", @"T", @"W", @"T", @"F", @"S" ];
    
    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:({
        __block NSMutableArray<__kindof UIView *> *labels = [NSMutableArray array];
        [weekdays enumerateObjectsUsingBlock:^(NSString *day, NSUInteger index, BOOL *sS){
            UIButton *l = [[UIButton alloc] init];
            l.tag = 1000 + index;
            [l addTarget:self action:@selector(toggle:) forControlEvents:UIControlEventTouchUpInside];
            [l setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [l setTitle:day forState:UIControlStateNormal];
            [labels addObject:l];
        }];
        labels;
    })];
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.spacing = .0f;
    self.stackView.distribution = UIStackViewDistributionFillEqually;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView insertSubview:self.stackView belowSubview:self.tf];
    [self.stackView.heightAnchor constraintEqualToConstant:42].active = YES;
    [self.stackView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8].active = YES;
    [self.stackView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-8].active = YES;
    [self.stackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    
    self.stackIndicator = [[UIView alloc] init];
    self.stackIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    self.stackIndicator.backgroundColor = [UIColor whiteColor];
    
    [self.stackView addSubview:self.stackIndicator];
    [self.stackIndicator.widthAnchor constraintEqualToAnchor:self.stackView.widthAnchor multiplier:1.0 / weekdays.count].active = YES;
    [self.stackIndicator.bottomAnchor constraintEqualToAnchor:self.stackView.bottomAnchor].active = YES;
    [self.stackIndicator.heightAnchor constraintEqualToConstant:2.0f].active = YES;
    self.stackIndicatorGuide = [self.stackIndicator.leftAnchor constraintEqualToAnchor:self.stackView.leftAnchor];
    self.stackIndicatorGuide.active = YES;
}

@end
