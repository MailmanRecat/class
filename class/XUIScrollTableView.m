//
//  XUIScrollTableView.m
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XUIScrollTableView.h"

@interface XUIScrollTableView()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation XUIScrollTableView

- (void)demo
{
    NSDictionary *data = @{
                           @"mon": @[
                                   
                                   ]
                           };
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.tleft.contentOffset = self.tcenter.contentOffset = self.tright.contentOffset = scrollView.contentOffset;
}

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
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = YES;
    self.showsVerticalScrollIndicator = NO;
    self.bounces = NO;
    
    UITableView *(^table)(void) = ^{
        UITableView *f = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        f.showsHorizontalScrollIndicator = NO;
        f.allowsMultipleSelectionDuringEditing = NO;
        f.backgroundColor = [UIColor colorWithWhite:236 / 255.0 alpha:1];
        f.delegate = self;
        f.dataSource = self;
        [self addSubview:f];
        [f.widthAnchor constraintEqualToAnchor:self.widthAnchor].active = YES;
        [f.heightAnchor constraintEqualToAnchor:self.heightAnchor constant:-20].active = YES;
        [f.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        return f;
    };
    
    self.tleft   = table();
    self.tcenter = table();
    self.tright  = table();
    
    [self.tleft.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [self.tcenter.leftAnchor constraintEqualToAnchor:self.tleft.rightAnchor].active = YES;
    [self.tcenter.rightAnchor constraintEqualToAnchor:self.tright.leftAnchor].active = YES;
    [self.tright.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
}

@end
