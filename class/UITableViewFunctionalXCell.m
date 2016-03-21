//
//  UITableViewFunctionalXCell.m
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "UITableViewFunctionalXCell.h"

@interface UITableViewFunctionalXCell()

@property( nonatomic, strong ) CAShapeLayer                         *border;

@end

@implementation UITableViewFunctionalXCell

- (instancetype)initWithReuseString:(NSString *)RString
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:RString];
    if( self )
    {
        if( [RString isEqualToString:REUSE_FUNCTIONAL_X_CELL_ID_BORDER] )
            [self UIBorder];
    }
    return self;
}

- (void)UIBorder
{
    self.border = [CAShapeLayer layer];
    self.border.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:199 / 255.0 blue:204 / 255.0 alpha:1].CGColor;
    [self.contentView.layer insertSublayer:self.border above:self.accessoryView.layer];
}

- (void)setUseBorder:(BOOL)useBorder
{
    _useBorder = useBorder;
    
    self.border.backgroundColor = useBorder ? [UIColor colorWithRed:200 / 255.0 green:199 / 255.0 blue:204 / 255.0 alpha:1].CGColor : [UIColor clearColor].CGColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if( [self.reuseIdentifier isEqualToString:REUSE_FUNCTIONAL_X_CELL_ID_BORDER] && _useBorder )
    {
        self.border.frame = CGRectMake(0, self.contentView.bounds.size.height - .5f, self.bounds.size.width, .5f);
    }
}

@end
