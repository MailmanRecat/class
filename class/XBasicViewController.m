//
//  XBasicViewController.m
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XBasicViewController.h"

@implementation XBasicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setTintColor:[UIColor colorWithRed:0 green:158 / 255.0 blue:74 / 255.0 alpha:1]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)selfViewLayoutIfNeed
{
    [UIView animateWithDuration:.25f delay:.0f options:( 7 << 16 )
                     animations:^{ [self.view layoutIfNeeded]; }
                     completion:nil];
}

- (void)dismissSelf
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
