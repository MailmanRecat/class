//
//  XClassViewController.m
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XSearchFieldViewController.h"

#import "XClassViewController.h"
#import "XClassEdtingViewController.h"
#import "XOptionsPickerViewController.h"

#import "XUIClassBar.h"
#import "XUIFloatingButton.h"

#import "XUIScrollTableView.h"

@interface XClassViewController()<UITextFieldDelegate, XUIScrollTableViewDelegate>

@property( nonatomic, strong ) XUIClassBar              *bar;
@property( nonatomic, strong ) NSLayoutConstraint       *barGuide;

@property( nonatomic, strong ) XUIFloatingButton        *plusFloating;
@property( nonatomic, strong ) NSLayoutConstraint       *plusFloatingGuide;

@property( nonatomic, strong ) XUIScrollTableView       *fox;
@property( nonatomic, assign ) CGFloat                   foxPointAnchor;

@end

@implementation XClassViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self UI];
}

- (void)UI
{
    self.bar = ({
        XUIClassBar *f = [[XUIClassBar alloc] init];
        f.tf.placeholder = @"Search for class";
        f.tf.delegate = self;
        [self.view addSubview:f];
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        self.barGuide = [f.topAnchor constraintEqualToAnchor:self.view.topAnchor];
        self.barGuide.active = YES;
        f;
    });
    
    self.fox = ({
        XUIScrollTableView *f = [[XUIScrollTableView alloc] init];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        f.xdelegate = self;
        [self.view insertSubview:f belowSubview:self.bar];
        [f.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
        f;
    });
    
    self.plusFloating = ({
        XUIFloatingButton *f = [[XUIFloatingButton alloc] initFromFont:[UIFont MaterialDesignIcons] title:[UIFont mdiPlus]];
        f.backgroundColor = self.view.tintColor;
        [f addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:f];
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16].active = YES;
        self.plusFloatingGuide = [f.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-16];
        self.plusFloatingGuide.active = YES;
        f;
    });
}

- (void)floatButtonHide
{
    [self plusFloadButtonHide:YES animation:YES];
}

- (void)floatButtonShow
{
    [self plusFloadButtonHide:NO animation:YES];
}

- (void)plusFloadButtonHide:(BOOL)hide animation:(BOOL)animation
{
    [self.plusFloatingGuide setConstant:hide ? 64 : -16];
    [UIView animateWithDuration:animation ? .25f : .0f delay:.0f options:( 7 << 16 )
                     animations:^{
                         [self.view layoutIfNeeded];
                     }completion:nil];
}

- (void)barEffectForDistance:(CGFloat)distance
{
    self.barGuide.constant += distance;
    if( self.barGuide.constant > 0   ) self.barGuide.constant = 0;
    if( self.barGuide.constant < -98 ) self.barGuide.constant = -98;
    
    self.bar.contentView.alpha = 1 - (fabs(self.barGuide.constant) / 98);
    
    [self.view layoutIfNeeded];
}

- (void)barPositionReset
{
    self.barGuide.constant = 0;
    self.bar.contentView.alpha = 1;
    [self selfViewLayoutIfNeed];
}

- (BOOL)isOnEffectArea:(CGFloat)point
{
    return point > -98 && point < self.fox.tcenter.contentSize.height - self.fox.tcenter.frame.size.height;
}

- (void)xscrollViewDidScroll:(UIScrollView *)scrollView
{
    if( scrollView != self.fox.tcenter ) return;
    CGFloat Y       = scrollView.contentOffset.y;
    CGFloat offset  = Y - self.foxPointAnchor;
    
    BOOL isOnEffect = [self isOnEffectArea:Y];
    
    if(  offset < 0 && isOnEffect )
    {
        [self barEffectForDistance:-offset];
        [self floatButtonShow];
    }
    else if( isOnEffect )
    {
        [self barEffectForDistance:-offset];
        [self floatButtonHide];
    }
    
    if( !isOnEffect )
    {
        [self barPositionReset];
    }
    
    self.foxPointAnchor = Y;
}

- (void)search
{
//    XNavigationController *X = [[XNavigationController alloc] initWithRootViewController:[XSearchFieldViewController new]];
    
    XOptionsPickerViewController *op = [[XOptionsPickerViewController alloc] init];
    op.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:op animated:YES completion:nil];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self search];
    return NO;
}

- (void)selfViewLayoutIfNeed
{
    [UIView animateWithDuration:.25f delay:.0f options:( 7 << 16 )
                     animations:^{
                         [self.view layoutIfNeeded];
                     }completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
