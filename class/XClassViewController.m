//
//  XClassViewController.m
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XSearchFieldViewController.h"

#import "XClassViewController.h"
#import "XOptionsPickerViewController.h"

#import "XUIClassBar.h"
#import "XUIFloatingButton.h"
#import "XUIDrawerView.h"

#import "XUIScrollTableView.h"

@interface XClassViewController()

@property( nonatomic, strong ) XUIClassBar              *bar;
@property( nonatomic, strong ) XUIDrawerView            *drawer;
@property( nonatomic, assign ) BOOL                      hideStatusBar;

@property( nonatomic, strong ) XUIFloatingButton        *plusFloating;

//@property( nonatomic, strong ) UITableView              *fox;
@property( nonatomic, strong ) XUIScrollTableView       *fox;

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
        f.backgroundColor = self.view.tintColor;
        f.tf.placeholder = @"Search For Class";
        [f.leftBarItem addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
        [f.tf addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        f;
    });
    
    self.drawer = ({
        XUIDrawerView *f = [[XUIDrawerView alloc] initWithItems:nil];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        f;
    });
    
    self.fox = ({
        XUIScrollTableView *f = [[XUIScrollTableView alloc] init];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        f.backgroundColor = [UIColor orangeColor];
        [self.view insertSubview:f belowSubview:self.bar];
        [f.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:118].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
        f;
    });
    
    self.plusFloating = ({
        XUIFloatingButton *f = [[XUIFloatingButton alloc] initFromFont:[UIFont MaterialDesignIcons] title:[UIFont mdiPlus]];
        f.backgroundColor = self.view.tintColor;
        [self.view addSubview:f];
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-16].active = YES;
        f;
    });
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.view endEditing:YES];
//    [self.view addSubview:self.drawer];
//    [self.drawer.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
//    [self.drawer.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
//    [self.drawer.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
//    [self.drawer.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
//    
//    self.hideStatusBar = YES;
//    
//    [self.drawer openDrawer];
//    
//    XOptionsPickerViewController *p = [[XOptionsPickerViewController alloc] init];
//    p.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    
//    [self presentViewController:p animated:NO completion:nil];
//}

- (void)search
{
    NSLog(@"search");
    [self presentViewController:[XSearchFieldViewController new] animated:YES completion:nil];
}

- (void)setHideStatusBar:(BOOL)hideStatusBar
{
    if( _hideStatusBar != hideStatusBar )
    {
        _hideStatusBar = hideStatusBar;
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (BOOL)prefersStatusBarHidden
{
    return self.hideStatusBar;
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
