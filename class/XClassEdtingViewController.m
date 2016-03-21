//
//  XClassEdtingViewController.m
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XClassEdtingViewController.h"
#import "XClass.h"

#import "XUIClassEdtingBar.h"

@interface XClassEdtingViewController()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) XUIClassEdtingBar                *bar;

@property( nonatomic, strong ) UITableView                      *fox;

@end

@implementation XClassEdtingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self UI];
}

- (void)UI
{
    self.bar = ({
        XUIClassEdtingBar *f = [[XUIClassEdtingBar alloc] init];
        f.backgroundColor = [UIColor whiteColor];
        [f.leftBarItem addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        f;
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
