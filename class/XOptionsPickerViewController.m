//
//  XOptionsPickerViewController.m
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XOptionsPickerViewController.h"

@interface XOptionsPickerViewController()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) UITableView              *fox;
@property( nonatomic, strong ) NSLayoutConstraint       *foxTopLayoutGuide;
@property( nonatomic, assign ) CGFloat                   foxLastAnchor;

@property( nonatomic, assign ) BOOL                      reset;

@end

@implementation XOptionsPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self UI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:.25f
                          delay:.00f options:( 7 << 16 )
                     animations:^{
                         self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
                         self.foxTopLayoutGuide.constant = -X_SVFH / 2.0f;
                         [self.view layoutIfNeeded];
                     }completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:.25f
                          delay:.0f options:( 7 << 16 )
                     animations:^{
                         self.view.backgroundColor = [UIColor clearColor];
                         self.foxTopLayoutGuide.constant = 0.0f;
                         [self.view layoutIfNeeded];
                     }completion:^( BOOL f ){
                         [self dismissViewControllerAnimated:NO completion:nil];
                     }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *C = [UITableViewCell new];
    C.textLabel.text = NSStringFromClass([indexPath class]);
    return C;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if( scrollView.contentOffset.y < 0 && !self.reset )
    {
        self.foxTopLayoutGuide.constant -= scrollView.contentOffset.y - self.foxLastAnchor;
        [self.view layoutIfNeeded];
    }
    
    self.foxLastAnchor = scrollView.contentOffset.y;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if( self.foxTopLayoutGuide.constant < -44 )
    {
        self.reset = YES;
        self.foxTopLayoutGuide.constant = -X_SVFH / 2.0f;
        [UIView animateWithDuration:.25f
                              delay:.0f options:( 7 << 16 )
                         animations:^{
                             [self.view layoutIfNeeded];
                         }completion:^(BOOL f){
                             self.reset = NO;
                         }];
    }
}

- (void)UI
{
    self.fox = ({
        UITableView *f = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        f.showsHorizontalScrollIndicator = NO;
        f.showsVerticalScrollIndicator = YES;
        f.allowsMultipleSelectionDuringEditing = NO;
        f.backgroundColor = [UIColor clearColor];
        f.separatorColor = [UIColor clearColor];
        f.sectionFooterHeight = .0f;
        f.tableFooterView = ({
            UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 300)];
            footer.backgroundColor = [UIColor whiteColor];
            footer;
        });
        f.contentInset = UIEdgeInsetsMake(0, 0, -300, 0);
        f.delegate = self;
        f.dataSource = self;
        [self.view addSubview:f];
        [f.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
        [f.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:.5f].active = YES;
        [f.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
        self.foxTopLayoutGuide = [f.topAnchor constraintEqualToAnchor:self.view.bottomAnchor];
        self.foxTopLayoutGuide.active = YES;
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
