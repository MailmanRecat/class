//
//  XUIClassBar.m
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XUIClassBar.h"
#import "UIFont+MaterialDesignIcons.h"

@interface XUIClassBar()<UITextFieldDelegate>

@property( nonatomic, strong ) UIStackView *stackView;
@property( nonatomic, strong ) UIView      *stackIndicator;

@end

@implementation XUIClassBar

- (instancetype)init
{
    self = [super init];
    if( self )
    {
        [self UI];
    }
    return self;
}

- (void)setFakeStatusBar:(UIView *)statusBar
{
    [statusBar setTag:1777];
    [self addSubview:statusBar];
    [statusBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [statusBar.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [statusBar.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [statusBar.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
    [statusBar.heightAnchor constraintEqualToConstant:20].active = YES;
}

- (void)removeFakeStatusBar
{
    [[self viewWithTag:1777] removeFromSuperview];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

- (void)UI
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.heightAnchor constraintEqualToConstant:118.0f].active = YES;
    
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
        f.clearButtonMode = UITextFieldViewModeWhileEditing;
        f.delegate = self;
        f.leftView = ({
            UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
            [b.titleLabel setFont:[UIFont MaterialDesignIcons]];
            [b setTitleColor:self.tintColor forState:UIControlStateNormal];
            [b setTitle:[UIFont mdiMenu] forState:UIControlStateNormal];
            b;
        });
        f.layer.cornerRadius = 4.0f;
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
            UILabel *l = [[UILabel alloc] init];
            l.textColor = [UIColor whiteColor];
            l.text = day;
            l.textAlignment = NSTextAlignmentCenter;
            [labels addObject:l];
        }];
        labels;
    })];
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.spacing = .0f;
    self.stackView.distribution = UIStackViewDistributionFillEqually;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:self.stackView];
    [self.stackView.heightAnchor constraintEqualToConstant:42].active = YES;
    [self.stackView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8].active = YES;
    [self.stackView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-8].active = YES;
    [self.stackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    
    self.stackIndicator = [[UIView alloc] init];
    self.stackIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    self.stackIndicator.backgroundColor = [UIColor whiteColor];
    
    [self.stackView addSubview:self.stackIndicator];
    [self.stackIndicator.widthAnchor constraintEqualToAnchor:self.stackView.widthAnchor multiplier:1.0 / weekdays.count].active = YES;
    [self.stackIndicator.leftAnchor constraintEqualToAnchor:self.stackView.leftAnchor constant:0].active = YES;
    [self.stackIndicator.bottomAnchor constraintEqualToAnchor:self.stackView.bottomAnchor].active = YES;
    [self.stackIndicator.heightAnchor constraintEqualToConstant:2.0f].active = YES;
}

@end
