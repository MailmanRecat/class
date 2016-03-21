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
#import "UITableSegmentHeaderView.h"

@interface XClassEdtingViewController()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) XClass                           *XClass;

@property( nonatomic, strong ) XUIClassEdtingBar                *bar;

@property( nonatomic, strong ) UITableView                      *fox;
@property( nonatomic, assign ) BOOL                              startActive;
@property( nonatomic, assign ) BOOL                              endActive;

@end

@implementation XClassEdtingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.XClass = [[XClass alloc] init];
    
    self.XClass.course = @"English";
    self.XClass.location = @"K109";
    
    [self UI];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 2 : 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( indexPath.section == 0 ) return 44.0f;
    
    if( indexPath.row == 2 ) return self.startActive ? 215.0f : .0f;
    if( indexPath.row == 4 ) return self.endActive   ? 215.0f : .0f;
    
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 56.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if( section == 1 )
    {
        UITableSegmentHeaderView *header = [tableView dequeueSegmentHeaderReusebleCell];
        header.segmentControl.selectedSegmentIndex = 0;
        return header;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( indexPath.section == 0 )
    {
        UITableViewCell *RC = [tableView dequeueDefaultReusebleCell];
        
        RC.textLabel.font = [UIFont systemFontOfSize:17];
        RC.textLabel.text = indexPath.row == 0 ? @"Course" : @"Location";
        RC.textLabel.textColor = [UIColor colorWithWhite:107 / 255.0 alpha:1];
        RC.detailTextLabel.font = [UIFont systemFontOfSize:19];
        RC.detailTextLabel.text = indexPath.row == 0 ? self.XClass.course : self.XClass.location;
        RC.detailTextLabel.textColor = [UIColor blackColor];
        RC.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return RC;
    }
    
    if( indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 5 )
    {
        UITableViewCell *RC = [tableView dequeueDefaultReusebleCell];
        
        RC.textLabel.font = [UIFont systemFontOfSize:17];
        if     ( indexPath.row == 0 ) RC.textLabel.text = @"Teacher";
        else if( indexPath.row == 1 ) RC.textLabel.text = @"Starts";
        else if( indexPath.row == 3 ) RC.textLabel.text = @"Ends";
        else if( indexPath.row == 5 ) RC.textLabel.text = @"Tag";
        RC.textLabel.textColor = [UIColor colorWithWhite:107 / 255.0 alpha:1];
        RC.detailTextLabel.font = [UIFont systemFontOfSize:19];
        if     ( indexPath.row == 0 ) RC.detailTextLabel.text = self.XClass.teacher;
        else if( indexPath.row == 1 ) RC.detailTextLabel.text = self.XClass.start;
        else if( indexPath.row == 3 ) RC.detailTextLabel.text = self.XClass.end;
        else if( indexPath.row == 5 ) RC.detailTextLabel.text = self.XClass.tag;
        RC.detailTextLabel.textColor = [UIColor blackColor];
        RC.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return RC;
    }
    
    UITableViewFunctionalCell *PC = [tableView deququeDefaultDatePickerReusebleCell];
    
    return PC;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if( indexPath.section && ( indexPath.row == 1 || indexPath.row == 3 ) )
    {
        [self toggleDatePicker:indexPath.row + 1];
    }
}

- (void)toggleDatePicker:(NSInteger)index
{
    if( index == 2 )
    {
        self.startActive = !self.startActive;
        self.endActive   = NO;
    }
    if( index == 4 )
    {
        self.endActive   = !self.endActive;
        self.startActive = NO;
    }
    [self.fox reloadRowsAtIndexPaths:@[
                                       [NSIndexPath indexPathForRow:2 inSection:1],
                                       [NSIndexPath indexPathForRow:4 inSection:1]
                                       ]
                    withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( [cell respondsToSelector:@selector(setSeparatorInset:)] )
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if( [cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)] )
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if( [cell respondsToSelector:@selector(setLayoutMargins:)] )
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
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
    
    self.fox = ({
        UITableView *f = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        f.showsHorizontalScrollIndicator = NO;
        f.allowsMultipleSelectionDuringEditing = NO;
        f.backgroundColor = [UIColor colorWithWhite:253 / 255.0 alpha:1];
        f.separatorColor = [UIColor colorWithWhite:214 / 255.0 alpha:1];
        f.cellLayoutMarginsFollowReadableWidth = NO;
        f.sectionFooterHeight = 0;
        f.delegate = self;
        f.dataSource = self;
        f.contentInset = UIEdgeInsetsMake(32, 0, 0, 0);
        [self.view insertSubview:f belowSubview:self.bar];
        [f.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
        f;
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
