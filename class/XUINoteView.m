//
//  XUINoteView.m
//  class
//
//  Created by caine on 3/22/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XUINoteView.h"
#import "UIFont+MaterialDesignIcons.h"

@interface XUINoteView()

@property( nonatomic, strong ) UILabel          *TLabel;
@property( nonatomic, copy   ) NSString         *note;

@end

@implementation XUINoteView

- (instancetype)initWithTitle:(NSString *)title note:(NSString *)note
{
    self = [super init];
    if( self )
    {
        [self UI];
        
        self.TLabel.text = title;
        self.TLabel.font = [UIFont systemFontOfSize:20];
        self.text = note;
        self.font = [UIFont systemFontOfSize:17];
    }
    return self;
}

- (void)layoutSubviews
{
    self.TLabel.frame = CGRectMake(16, 4, self.frame.size.width - 16 - 56 - 44, 56);
    self.checkButton.frame = CGRectMake(self.frame.size.width - 56, 4, 56, 56);
}

- (void)UI
{
    self.textContainerInset = UIEdgeInsetsMake(60, 16, 0, 16);
    self.textContainer.lineFragmentPadding = .0f;
    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.scrollEnabled = NO;
    self.editable = NO;
    self.selectable = NO;
    self.TLabel = ({
        UILabel *l = [[UILabel alloc] init];
        [self addSubview:l];
        l;
    });
    self.checkButton = ({
        UIButton *f = [[UIButton alloc] init];
        f.titleLabel.font = [UIFont MaterialDesignIcons];
        [f setTitle:[UIFont mdiCheckAll] forState:UIControlStateNormal];
        [f setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [f setTitleColor:[UIColor colorWithWhite:1 alpha:.4f] forState:UIControlStateHighlighted];
        [self addSubview:f];
        f;
    });
    
    self.textColor = [UIColor whiteColor];
    self.TLabel.textColor = [UIColor whiteColor];
}

@end
