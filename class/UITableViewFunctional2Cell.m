//
//  UITableViewFunctional2Cell.m
//  Chart
//
//  Created by caine on 3/7/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "UITableViewFunctional2Cell.h"

@interface UITableViewFunctional2Cell()

@end

@implementation UITableViewFunctional2Cell

- (instancetype)initWithReuseString:(NSString *)RString{
    
    UITableViewCellStyle style = UITableViewCellStyleValue1;
        
    self = [super initWithStyle:style reuseIdentifier:RString];
    if( self )
    {
        if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_SWITCH] )
            [self UISwitch];
        
        if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_BIGIMAGE] )
            [self UIBIGImage];
    }
    return self;
}

- (void)UIBIGImage
{    
    self.BMName = [[UILabel alloc] init];
    self.BMTime = [[UILabel alloc] init];
    self.BMName.translatesAutoresizingMaskIntoConstraints = NO;
    self.BMTime.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.BMName.backgroundColor = self.BMTime.backgroundColor = [UIColor clearColor];
    self.BMName.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
    self.BMTime.font = [UIFont systemFontOfSize:13.5];
    self.BMTime.textColor = [UIColor colorWithWhite:170 / 255.0 alpha:1];
    
    [self.contentView addSubview:self.BMName];
    [self.contentView addSubview:self.BMTime];
    
    [self.BMName.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:2].active = YES;
    [self.BMName.leftAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.leftAnchor].active = YES;
    [self.BMName.rightAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.rightAnchor].active = YES;
    [self.BMName.heightAnchor constraintEqualToConstant:42].active = YES;
    
    [self.BMTime.topAnchor constraintEqualToAnchor:self.BMName.bottomAnchor constant:-6].active = YES;
    [self.BMTime.leftAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.leftAnchor].active = YES;
    [self.BMTime.rightAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.rightAnchor].active = YES;
    [self.BMTime.heightAnchor constraintEqualToConstant:13].active = YES;
    
    self.bigImageView = ({
        UIImageView *imv = [[UIImageView alloc] init];
        [imv setContentMode:UIViewContentModeScaleAspectFit];
        [imv setClipsToBounds:YES];
        [imv setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView insertSubview:imv belowSubview:self.BMTime];
        [imv.topAnchor constraintEqualToAnchor:self.BMTime.bottomAnchor].active = YES;
        [imv.leftAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.leftAnchor constant:-8].active = YES;
        [imv.rightAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.rightAnchor constant:8].active = YES;
        [imv.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-2].active = YES;
        imv;
    });
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)UISwitch
{
    self.toggle = ({
        UISwitch *s = [[UISwitch alloc] init];
        [s setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:s];
        [s.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        [s.rightAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.rightAnchor].active = YES;
        s;
    });
}

@end
