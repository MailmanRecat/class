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
@property( nonatomic, strong ) XUIFloatingButton        *accountFloating;
@property( nonatomic, strong ) XUIFloatingButton        *tipFloating;
@property( nonatomic, strong ) UIControl                *maskWhiteView;
@property( nonatomic, strong ) NSArray<UILabel *>       *tipsCache;
@property( nonatomic, assign ) BOOL                      actionNextStep;


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
        f.backgroundColor = [UIColor colorWithRed:218 / 255.0 green:68 / 255.0 blue:54 / 255.0 alpha:1];
        [f addTarget:self action:@selector(actionsStep) forControlEvents:UIControlEventTouchUpInside];
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

- (void)actionsStep
{
    if( self.actionNextStep ) return; self.actionNextStep = YES;
    
    self.maskWhiteView = ({
        UIControl *f = [[UIControl alloc] init];
        f.backgroundColor = [UIColor colorWithWhite:1 alpha:.9f];
        f.alpha = .0f;
        f.translatesAutoresizingMaskIntoConstraints = NO;
        [f addTarget:self action:@selector(actionStepCancel) forControlEvents:UIControlEventTouchUpInside];
        [self.view insertSubview:f belowSubview:self.plusFloating];
        [f.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
        f;
    });
    
    CGRect (^dirtyRect)(NSString *, UIFont *, CGSize) = ^(NSString *string, UIFont *font, CGSize rect)
    {
        return [string boundingRectWithSize:rect
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:@{ NSFontAttributeName: font }
                                    context:nil];
    };
    
    UILabel *(^flabel)(NSString *, NSLayoutAnchor *) = ^(NSString *text, NSLayoutAnchor *centerYanchor)
    {
        UILabel *l = [[UILabel alloc] init];
        l.text = text;
        l.alpha = .0f;
        l.layer.cornerRadius = 3.0f;
        l.clipsToBounds = YES;
        l.font = [UIFont systemFontOfSize:13.5];
        l.textAlignment = NSTextAlignmentCenter;
        l.backgroundColor = [UIColor colorWithWhite:236 / 255.0 alpha:1];
        l.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view insertSubview:l aboveSubview:self.maskWhiteView];
        [l.heightAnchor constraintEqualToConstant:29].active = YES;
        [l.widthAnchor constraintEqualToConstant:dirtyRect(text, l.font, CGSizeMake(X_SVFW, 29)).size.width + 16].active = YES;
        [l.centerYAnchor constraintEqualToAnchor:centerYanchor].active = YES;
        [l.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-88].active = YES;
        return l;
    };
    
    XUIFloatingButton *(^fbutton)(NSString *, UIColor *, CGFloat) = ^(NSString *title, UIColor *color, CGFloat constant)
    {
        XUIFloatingButton *f = [[XUIFloatingButton alloc] init40FromFont:[UIFont MaterialDesignIconsWithSize:17] title:title];
        f.backgroundColor = color;
        f.alpha = .0f;
        f.transform = CGAffineTransformMakeTranslation(0, 16);
        [f addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:f];
        [f.centerXAnchor constraintEqualToAnchor:self.plusFloating.centerXAnchor].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.plusFloating.topAnchor constant:constant].active = YES;
        return f;
    };
    
    self.accountFloating = fbutton([UIFont mdiAccount], [UIColor colorWithRed:240 / 255.0 green:159 / 255.0 blue:59 / 255.0 alpha:1], -72);
    self.tipFloating     = fbutton([UIFont mdiPencil], self.view.tintColor, -16);
    self.tipsCache       = @[
                             flabel(@"Accounts", self.accountFloating.centerYAnchor),
                             flabel(@"Tips for today", self.tipFloating.centerYAnchor),
                             flabel(@"New class", self.plusFloating.centerYAnchor)
                             ];
    
    [UIView animateWithDuration:.25f delay:.0f options:( 7 << 16 )
                     animations:^{
                         self.maskWhiteView.alpha = 1.0f;
                         self.accountFloating.alpha = self.tipFloating.alpha = 1.0f;
                         self.accountFloating.transform = CGAffineTransformMakeTranslation(0, 0);
                         self.tipFloating.transform = CGAffineTransformMakeTranslation(0, 0);
                         self.accountFloating.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         self.tipFloating.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         self.plusFloating.titleLabel.transform = CGAffineTransformMakeRotation(M_PI);
                         [self.tipsCache enumerateObjectsUsingBlock:^(UILabel *tip, NSUInteger tag, BOOL *sS){
                             tip.alpha = 1.0f;
                         }];
                     }completion:nil];
}

- (void)actionStepCancel
{
    self.actionNextStep = NO;
    [UIView animateWithDuration:.25f delay:.0f options:( 7 << 16 )
                     animations:^{
                         self.maskWhiteView.alpha = self.accountFloating.alpha = self.tipFloating.alpha = .0f;
                         self.accountFloating.transform = CGAffineTransformMakeTranslation(0, 8);
                         self.tipFloating.transform = CGAffineTransformMakeTranslation(0, 8);
                         self.plusFloating.titleLabel.transform = CGAffineTransformMakeRotation(0);
                         [self.tipsCache enumerateObjectsUsingBlock:^(UILabel *tip, NSUInteger tag, BOOL *sS){
                             tip.alpha = 0;
                         }];
                     }completion:^(BOOL f){
                         [self.maskWhiteView removeFromSuperview];
                         [self.accountFloating removeFromSuperview];
                         [self.tipFloating removeFromSuperview];
                         self.maskWhiteView = self.accountFloating = self.tipFloating = nil;
                         [self.tipsCache enumerateObjectsUsingBlock:^(UILabel *tip, NSUInteger tag, BOOL *sS){
                             [tip removeFromSuperview];
                         }];
                         self.tipsCache = nil;
                     }];
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
