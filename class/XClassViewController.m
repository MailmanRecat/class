//
//  XClassViewController.m
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XClassViewController.h"

#import "XUIClassBar.h"

@interface XClassViewController()

@property( nonatomic, strong ) XUIClassBar *bar;

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
        [self.view addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        f;
    });
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
