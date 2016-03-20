//
//  XUIDrawerView.m
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XUIDrawerView.h"

@interface XUIDrawerView()

@property( nonatomic, strong ) UIControl      *contentView;
@property( nonatomic, strong ) UIScrollView   *drawer;
//@property( nonatomic, strong ) UIStackView *stack;

@property( nonatomic, strong ) NSLayoutConstraint *drawerLeftlayoutGuide;

@end

@implementation XUIDrawerView

- (instancetype)initWithItems:(NSArray<NSAttributedString *> *)items
{
    self = [super init];
    if( self )
    {
        [self UI];
    }
    return self;
}

- (void)openDrawer
{
    [self layoutIfNeeded];
    [UIView animateWithDuration:.25f
                          delay:.0f options:( 7 << 16 )
                     animations:^{
                         self.drawerLeftlayoutGuide.constant = 0.0f;
                         self.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
                         
                         [self.contentView layoutIfNeeded];
                     }
                     completion:nil];
}

- (void)closeDrawer
{
    [UIView animateWithDuration:.25f
                          delay:.0f options:( 7 << 16 )
                     animations:^{
                         self.drawerLeftlayoutGuide.constant = -self.contentView.frame.size.width * 0.618f;
                         self.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
                         
                         [self.contentView layoutIfNeeded];
                     }
                     completion:^(BOOL f){
                         [self removeFromSuperview];
                     }];
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    self.drawerLeftlayoutGuide.constant = -self.contentView.frame.size.width * 0.618;
}

- (void)UI
{
    [self setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    self.contentView =({
        UIControl *f = [[UIControl alloc] init];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        [f addTarget:self action:@selector(closeDrawer) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:f];
        [f.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [f.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
        [f.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        f;
    });
    
    self.drawer = ({
        UIScrollView *f = [[UIScrollView alloc] init];
        f.backgroundColor = [UIColor orangeColor];
        f.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:f];
        self.drawerLeftlayoutGuide = [f.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor];
        self.drawerLeftlayoutGuide.active = YES;
        [f.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [f.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor multiplier:0.618].active = YES;
        [f.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        f;
    });
    
    self.drawerLeftlayoutGuide.constant = -375 * 0.618;
}

@end
