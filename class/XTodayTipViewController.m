//
//  XTodayTipViewController.m
//  class
//
//  Created by caine on 3/23/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XTodayTipViewController.h"

#import "XUIBar.h"

@interface XTodayTipViewController()<UITextViewDelegate>

@property( nonatomic, strong ) XUIBar                           *bar;
@property( nonatomic, strong ) UIButton                         *done;
@property( nonatomic, strong ) UITextField                      *titleField;
@property( nonatomic, strong ) UITextView                       *contentField;
@property( nonatomic, strong ) NSLayoutConstraint               *contentFieldGuide;

@end

static NSString *const InvaildNote = @"Note something";
static NSString *const EmptyNote   = @"";

@implementation XTodayTipViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self UI];
    [self addNotificationObserver];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self selfDoneStateReset];
}

- (void)selfDoneStateReset
{
    self.done.enabled = ![self.titleField.text isEqualToString:EmptyNote];
}

- (void)addNotificationObserver
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(willKeyBoardChangeFrame:)
                   name:UIKeyboardWillChangeFrameNotification
                 object:nil];
}

- (void)willKeyBoardChangeFrame:(NSNotification *)keyboardInfo
{
    NSDictionary *info = [keyboardInfo userInfo];
    self.contentFieldGuide.constant = -(self.view.frame.size.height - [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y);
    [self selfViewLayoutIfNeed];
}

- (void)textFieldOnEdting:(UITextField *)textField
{
    [self selfDoneStateReset];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if( [[textView.text stringRemoveEdgeSpace] isEqualToString:InvaildNote] )
    {
        textView.text = EmptyNote;
        textView.textColor = [UIColor blackColor];
    }
    [self selfDoneStateReset];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if( [[textView.text stringRemoveEdgeSpace] isEqualToString:EmptyNote] )
    {
        textView.text = InvaildNote;
        textView.textColor = [UIColor lightGrayColor];
    }
    [self selfDoneStateReset];
    return YES;
}

- (void)UI
{
    self.bar = ({
        XUIBar *f = [[XUIBar alloc] initWithBack:XUIBarBackClose];
        f.titleLabel.text = @"Notes";
        
        self.done = [[UIButton alloc] init];
        self.done.translatesAutoresizingMaskIntoConstraints = NO;
        self.done.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        self.done.titleLabel.font = [UIFont MaterialDesignIcons];
        [self.done setTitle:[UIFont mdiCheck] forState:UIControlStateNormal];
        [self.done setTitleColor:self.view.tintColor forState:UIControlStateNormal];
        [self.done setTitleColor:[self.view.tintColor colorWithAlphaComponent:.4f] forState:UIControlStateHighlighted];
        [self.done setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        [f.contentView addSubview:self.done];
        [self.done.topAnchor constraintEqualToAnchor:f.contentView.topAnchor].active = YES;
        [self.done.rightAnchor constraintEqualToAnchor:f.contentView.rightAnchor constant:-16].active = YES;
        [self.done.bottomAnchor constraintEqualToAnchor:f.contentView.bottomAnchor].active = YES;
        [self.done.widthAnchor constraintEqualToConstant:56].active = YES;
        
        [f.leftItem addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        [f.heightAnchor constraintEqualToConstant:STATUS_BAR_HEIGHT + 56].active = YES;
        f;
    });
    self.titleField = ({
        UITextField *f = [[UITextField alloc] init];
        f.placeholder = @"Title";
        f.leftViewMode = f.clearButtonMode = UITextFieldViewModeAlways;
        f.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 0)];
        
        void (^border)(NSLayoutAnchor *, BOOL) = ^(NSLayoutAnchor *verticalAnchor, BOOL isTop)
        {
            UIView *border = [[UIView alloc] init];
            border.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:199 / 255.0 blue:204 / 255.0 alpha:1];
            border.translatesAutoresizingMaskIntoConstraints = NO;
            [f addSubview:border];
            [border.heightAnchor constraintEqualToConstant:0.5].active = YES;
            [border.leftAnchor constraintEqualToAnchor:f.leftAnchor].active = YES;
            [border.rightAnchor constraintEqualToAnchor:f.rightAnchor].active = YES;
            if( isTop )
                [border.topAnchor constraintEqualToAnchor:verticalAnchor].active = YES;
            else
                [border.bottomAnchor constraintEqualToAnchor:verticalAnchor].active = YES;
        };
        
        border(f.topAnchor, YES);
        border(f.bottomAnchor, NO);
        
        f.translatesAutoresizingMaskIntoConstraints = NO;
        [f addTarget:self action:@selector(textFieldOnEdting:) forControlEvents:UIControlEventAllEditingEvents];
        [self.view addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.bar.bottomAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        [f.heightAnchor constraintEqualToConstant:45].active = YES;
        [f.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
        f;
    });
    self.contentField = ({
        UITextView *f = [[UITextView alloc] init];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        f.delegate = self;
        f.font = [UIFont systemFontOfSize:17];
        f.contentInset = UIEdgeInsetsZero;
        f.textContainerInset = UIEdgeInsetsMake(12, 12, 12, 12);
        f.text = InvaildNote;
        f.textColor = [UIColor lightGrayColor];
        [self.view addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.titleField.bottomAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        self.contentFieldGuide = [f.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor];
        self.contentFieldGuide.active = YES;
        f;
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
