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
                         [self.view removeConstraint:self.foxTopLayoutGuide];
                         self.foxTopLayoutGuide = [self.fox.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor];
                         self.foxTopLayoutGuide.active = YES;
                         [self.view setNeedsUpdateConstraints];
                         [self.view layoutIfNeeded];
                     }completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *C = [UITableViewCell new];
    C.textLabel.text = NSStringFromClass([indexPath class]);
    return C;
}

- (void)UI
{
    self.fox = ({
        UITableView *f = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        f.showsHorizontalScrollIndicator = NO;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
