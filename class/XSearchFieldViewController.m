//
//  XSearchFieldViewController.m
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XSearchFieldViewController.h"

@implementation XSearchCache

+ (NSMutableArray *)searchHistory:(NSString *)keyword
{
    return [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] arrayForKey:keyword]];
}

+ (void)clear:(NSString *)history
{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:history];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

@interface XSearchFieldViewController()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) NSArray<NSString *>  *searchPool;

@property( nonatomic, strong ) UIView               *contentView;
@property( nonatomic, strong ) NSLayoutConstraint   *contentViewHeightLayoutGuide;

@property( nonatomic, strong ) UITextField          *searchField;
@property( nonatomic, strong ) UILabel              *tipBoard;
@property( nonatomic, strong ) UITableView          *fox;

@property( nonatomic, assign ) CGFloat               heightForKeyboard;

@end

@implementation XSearchFieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.history = [NSMutableArray arrayWithArray:@[
                                                    @"fuck", @"dick", @"nick", @"apple", @"banana", @"chair",
                                                    @"iOS 8",
                                                    @"introduces",
                                                    @"the",
                                                    @"concept",
                                                    @"of",
                                                    @"layout",
                                                    @"margins.",
                                                    @"By",
                                                    @"default",
                                                    @"a",
                                                    @"view's",
                                                    @"layout",
                                                    @"margins"                                                    ]];
    self.searchPool = [NSMutableArray array];
    self.placeholderString = @"Search For Class";
    
    [self UI];
    [self addNotificationObserver];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.searchField becomeFirstResponder];
}

- (void)addNotificationObserver{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(willKeyBoardChangeFrame:)
                   name:UIKeyboardWillChangeFrameNotification
                 object:nil];
}

- (void)willKeyBoardChangeFrame:(NSNotification *)keyboardInfo{
    NSDictionary *info = [keyboardInfo userInfo];
    self.heightForKeyboard = self.view.frame.size.height - [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
}

- (void)viewShouldUpdateLayout
{
    [UIView animateWithDuration:.25f
                          delay:.0f options:( 7 << 16 )
                     animations:^{
                         self.contentViewHeightLayoutGuide.constant = [self heightForContentView];
                         [self.contentView layoutIfNeeded];
                     }completion:nil];
    
    [self.fox reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    self.tipBoard.text = [NSString stringWithFormat:@"%ld Found", [self.fox numberOfRowsInSection:0]];
}

- (CGFloat)heightForContentView
{
    CGFloat h = (self.searchField.text.length == 0 ? self.history.count : self.searchPool.count + 2) * 44.0f;
    CGFloat e = X_SVFH - (self.heightForKeyboard + 44 + 8 + 6 + [UIApplication sharedApplication].statusBarFrame.size.height);
    return  h > e ? e : h ;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchField.text.length == 0 ? self.history.count : self.searchPool.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *c = [UITableViewCell new];
    c.textLabel.text = self.searchField.text.length == 0 ? self.history[indexPath.row] : self.searchPool[indexPath.row];
    c.layoutMargins = UIEdgeInsetsZero;
    c.separatorInset = UIEdgeInsetsZero;
    return c;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)textFieldOnEdting:(UITextField *)textField
{
    __block NSMutableArray *pool = [NSMutableArray array];
    [pool addObject:textField.text];
    [self.history enumerateObjectsUsingBlock:^(NSString *string, NSUInteger index, BOOL *sS){
        if( [[string lowercaseString] rangeOfString:textField.text.lowercaseString].location != NSNotFound )
        {
            [pool addObject:string];
        }
    }];
    self.searchPool = (NSArray *)pool;
    [self viewShouldUpdateLayout];
}

- (void)UI
{
    self.contentView = ({
        UIView *f = [[UIView alloc] init];
        f.backgroundColor = [UIColor whiteColor];
        f.layer.cornerRadius = 4.0f;
        [f letShadowWithSize:CGSizeMake(0, 1) opacity:.27f radius:1.7];
        [f setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.view.topAnchor
                                    constant:[UIApplication sharedApplication].statusBarFrame.size.height + 6].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:8].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-8].active = YES;
        self.contentViewHeightLayoutGuide = [f.heightAnchor constraintEqualToConstant:[self heightForContentView]];
        self.contentViewHeightLayoutGuide.active = YES;
        f;
    });
    
    self.searchField = ({
        UITextField *f = [UITextField new];
        f.backgroundColor = [UIColor whiteColor];
        f.rightViewMode = UITextFieldViewModeAlways;
        f.clearButtonMode = UITextFieldViewModeWhileEditing;
        f.layer.cornerRadius = 4.0f;
        f.placeholder = self.placeholderString;
        f.rightView = ({
            UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
            [b setTitleColor:self.view.tintColor forState:UIControlStateNormal];
            [b setTitle:@"Cancel" forState:UIControlStateNormal];
            [b addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
            b;
        });
        
        [f addTarget:self action:@selector(textFieldOnEdting:) forControlEvents:UIControlEventAllEditingEvents];
        [f setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-8].active = YES;
        [f.heightAnchor constraintEqualToConstant:44].active = YES;
        f;
    });
    
    self.tipBoard = ({
        UILabel *l = [[UILabel alloc] init];
        l.textColor = self.view.tintColor;
        l.text = @"History";
        l.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:l];
        [l.topAnchor constraintEqualToAnchor:self.searchField.bottomAnchor].active = YES;
        [l.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16].active = YES;
        [l.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-8].active = YES;
        [l.heightAnchor constraintEqualToConstant:44].active = YES;
        l;
    });
    
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:199 / 255.0 blue:204 / 255.0 alpha:1];
    border.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:border];
    [border.heightAnchor constraintEqualToConstant:0.5].active = YES;
    [border.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [border.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [border.bottomAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:43.5].active = YES;
    
    self.fox = ({
        UITableView *f = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        f.showsHorizontalScrollIndicator = NO;
        f.allowsMultipleSelectionDuringEditing = NO;
        f.sectionFooterHeight = .0f;
        f.sectionHeaderHeight = .0f;
        f.layer.cornerRadius = 4.0f;
        f.separatorColor = [UIColor clearColor];
        f.backgroundColor = [UIColor whiteColor];
        f.delegate = self;
        f.dataSource = self;
        [self.contentView addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.tipBoard.bottomAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        f;
    });
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end