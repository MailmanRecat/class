//
//  XClassEdtingViewController.m
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XClassEdtingViewController.h"

#import "XUIClassEdtingBar.h"
#import "UITableSegmentHeaderView.h"
#import "XUIFloatingButton.h"

@interface XClassEdtingViewController()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) XClass                           *XClass;

@property( nonatomic, strong ) XUIClassEdtingBar                *bar;

@property( nonatomic, strong ) UITableView                      *fox;
@property( nonatomic, assign ) BOOL                              startActive;
@property( nonatomic, assign ) BOOL                              endActive;

@property( nonatomic, strong ) NSIndexPath                      *startIndexPath;
@property( nonatomic, strong ) NSIndexPath                      *endIndexPath;
@property( nonatomic, strong ) NSMutableArray                   *schedule;

@property( nonatomic, strong ) XUIFloatingButton                *plusFloating;

@end

@implementation XClassEdtingViewController

- (instancetype)initWithXClass:(XClass *)XClass model:(XClassEdtingModel)model
{
    self = [super init];
    if( self )
    {
        if( model == XClassEdtingModelDefault )
            self.schedule           = [NSMutableArray array];
        
        self.XClass                 = XClass;
        self.displayModel           = model;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.XClass = [[XClass alloc] init];
    
    self.XClass.course      = @"English";
    self.XClass.location    = @"K109";
    self.XClass.teacher     = @"craig";
    self.XClass.tag         = @"tag";
    
    self.displayModel       = XClassEdtingModelDefault;
    self.schedule           = [NSMutableArray array];
    [self.schedule addObject:@"one"];
    
    [self UI];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.displayModel == XClassEdtingModelDefault ? self.schedule.count + 1 : 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 4 : 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( indexPath.section != 0 && (indexPath.row == 2 || indexPath.row == 4) )
    {
        if( self.startIndexPath && [tableView isDirtyEqual:indexPath toIndexPath:self.startIndexPath] ) return 215.0f;
        if( self.endIndexPath   && [tableView isDirtyEqual:indexPath toIndexPath:self.endIndexPath]   ) return 215.0f;
        
        return .0f;
    }
    
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 32.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    if( section == 1 )
//    {
//        UITableSegmentHeaderView *header = [tableView dequeueSegmentHeaderReusebleCell];
//        header.segmentControl.selectedSegmentIndex = 0;
//        return header;
//    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( indexPath.section == 0 )
    {
        UITableViewCell *RC = [tableView dequeueDefaultReusebleCell];
        
        RC.textLabel.font = [UIFont systemFontOfSize:17];
        if     ( indexPath.row == 0 ) RC.textLabel.text = @"Course";
        else if( indexPath.row == 1 ) RC.textLabel.text = @"Location";
        else if( indexPath.row == 2 ) RC.textLabel.text = @"Teacher";
        else if( indexPath.row == 3 ) RC.textLabel.text = @"Tag";
        RC.textLabel.textColor = [UIColor colorWithWhite:107 / 255.0 alpha:1];
        RC.detailTextLabel.font = [UIFont systemFontOfSize:19];
        if     ( indexPath.row == 0 ) RC.detailTextLabel.text = self.XClass.course;
        else if( indexPath.row == 1 ) RC.detailTextLabel.text = self.XClass.location;
        else if( indexPath.row == 2 ) RC.detailTextLabel.text = self.XClass.teacher;
        else if( indexPath.row == 3 ) RC.detailTextLabel.text = self.XClass.tag;
        RC.detailTextLabel.textColor = [UIColor blackColor];
        RC.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return RC;
    }
    
    if( indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 6 )
    {
        UITableViewCell *RC = [tableView dequeueDefaultReusebleCell];
        
        RC.textLabel.font = [UIFont systemFontOfSize:17];
        if     ( indexPath.row == 0 ) RC.textLabel.text = @"Weekday";
        else if( indexPath.row == 1 ) RC.textLabel.text = @"Starts";
        else if( indexPath.row == 3 ) RC.textLabel.text = @"Ends";
        else if( indexPath.row == 5 ) RC.textLabel.text = @"Repeat";
        else if( indexPath.row == 6 ) RC.textLabel.text = @"Delete";
        
        RC.textLabel.textColor = indexPath.row == 6 ? [UIColor colorWithRed:250 / 255.0 green:17 / 255.0 blue:79 / 255.0 alpha:1] : [UIColor colorWithWhite:107 / 255.0 alpha:1];
        RC.detailTextLabel.font = [UIFont systemFontOfSize:19];
//        if     ( indexPath.row == 0 ) RC.detailTextLabel.text = self.XClass.teacher;
//        else if( indexPath.row == 1 ) RC.detailTextLabel.text = self.XClass.start;
//        else if( indexPath.row == 3 ) RC.detailTextLabel.text = self.XClass.end;
//        else if( indexPath.row == 5 ) RC.detailTextLabel.text = self.XClass.tag;
        RC.detailTextLabel.textColor = [UIColor blackColor];
        
        RC.accessoryType = indexPath.row == 6 ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
        
        return RC;
    }
    
    UITableViewFunctionalCell *PC = [tableView deququeDefaultDatePickerReusebleCell];
    
    return PC;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if( indexPath.section != 0 && ( indexPath.row == 1 || indexPath.row == 3 ) )
    {
        [self toggleDatePicker:[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section]];
    }
}

- (void)toggleDatePicker:(NSIndexPath *)indexPath
{
    if( indexPath.row == 2 )
    {
        self.startIndexPath = self.startIndexPath == nil ? indexPath : nil;
        self.endIndexPath   = nil;
    }
    if( indexPath.row == 4 )
    {
        self.startIndexPath = nil;
        self.endIndexPath   = self.endIndexPath == nil ? indexPath : nil;
    }
    [self.fox reloadRowsAtIndexPaths:@[
                                       [NSIndexPath indexPathForRow:2 inSection:indexPath.section],
                                       [NSIndexPath indexPathForRow:4 inSection:indexPath.section]
                                       ]
                    withRowAnimation:UITableViewRowAnimationFade];
}

- (void)addClassSchedule:(NSDictionary *)schedule
{
    [self.schedule addObject:@"fuck"];
    [self newlySection];
}

- (void)newlySection
{
    [self.fox beginUpdates];
    [self.fox insertSections:[NSIndexSet indexSetWithIndex:self.fox.numberOfSections] withRowAnimation:UITableViewRowAnimationFade];
    [self.fox endUpdates];
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
    
    self.plusFloating = ({
        XUIFloatingButton *f = [[XUIFloatingButton alloc] initFromFont:[UIFont MaterialDesignIcons] title:[UIFont mdiPlus]];
        f.backgroundColor = self.view.tintColor;
        [f addTarget:self action:@selector(addClassSchedule:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:f];
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-16].active = YES;
        f;
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
