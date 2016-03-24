//
//  XUIScrollTableView.m
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XUIScrollTableView.h"
#import "XUINoteView.h"

@interface XUIScrollTableView()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) NSDictionary<NSString *, NSArray *> *data;

@end

@implementation XUIScrollTableView

- (void)demo
{
    NSDictionary *data = @{
                           @"mon": @[
                                   @{
                                       @"time": @"9:00",
                                       @"name": @"fuck",
                                       @"class": @1
                                       },
                                   @{
                                       @"time": @"10:00",
                                       @"name": @"dick",
                                       @"class": @2
                                       },
                                   @{
                                       @"time": @"12:00",
                                       @"name": @"mike",
                                       @"class": @3
                                       },
                                   @{
                                       @"time": @"12:00",
                                       @"name": @"mike",
                                       @"class": @3
                                       }
                                   ]
                           };
    
    self.data = data;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ((NSArray *)self.data[@"mon"]).count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [((NSNumber *)((NSDictionary *)((NSArray *)self.data[@"mon"])[section])[@"class"]) integerValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *C = [UITableViewCell new];
    C.textLabel.text = ((NSDictionary *)((NSArray *)self.data[@"mon"])[indexPath.section])[@"name"];
    return C;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.tleft.contentOffset = self.tcenter.contentOffset = self.tright.contentOffset = scrollView.contentOffset;
    
    if( self.xdelegate && [self.xdelegate respondsToSelector:@selector(xscrollViewDidScroll:)] )
    {
        [self.xdelegate xscrollViewDidScroll:scrollView];
    }
}

- (instancetype)init
{
    self = [super init];
    if( self )
    {
        [self demo];
        [self setTintColor:[UIColor colorWithRed:0 green:153 / 255.0 blue:153 / 255.0 alpha:1]];
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
        
        NSString *note = @"This structure shows a permanent app bar with a floating action button. The app bar absorbs elements from the tablet and mobile bottom bars. An optional bottom bar can be added for additional functionality or action overflow. A side nav overlays all other structural elements. A right nav menu can be accessed temporarily or pinned for permanent display.";
        
        XUINoteView *N = [[XUINoteView alloc] initWithTitle:@"Note for today"
                                                       note:note];
        
        CGRect (^dirtyRect)(NSString *, UIFont *) = ^(NSString *string, UIFont *font){
            return [string boundingRectWithSize:CGSizeMake(375, 10000)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{
                                                  NSFontAttributeName: font
                                                  }
                                        context:nil];
        };
        
        N.backgroundColor = self.tintColor;
        N.frame = CGRectMake(0, 0, 0, dirtyRect(note, N.font).size.height + 56 + 16);
        f.tableHeaderView = N;
        f.contentInset = f.scrollIndicatorInsets = UIEdgeInsetsMake(98, 0, 0, 0);
        f.contentOffset = CGPointMake(0, -98);
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
    
    self.tcenter.tag = 7777;
    
    [self.tleft.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [self.tcenter.leftAnchor constraintEqualToAnchor:self.tleft.rightAnchor].active = YES;
    [self.tcenter.rightAnchor constraintEqualToAnchor:self.tright.leftAnchor].active = YES;
    [self.tright.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
}

@end
