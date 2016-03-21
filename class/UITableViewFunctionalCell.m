//
//  UITableViewCellWithPicker.m
//  CRTestingProject
//
//  Created by caine on 1/13/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "UITableViewFunctionalCell.h"
#import "UIFont+MaterialDesignIcons.h"

@interface UITableViewFunctionalCell()

//For color2
@property( nonatomic, strong ) UILabel *color2icon;

@end

@implementation UITableViewFunctionalCell

- (instancetype)initWithReuseString:(NSString *)RString{
    
    UITableViewCellStyle style =
    ([RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_DEFAULT] | [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_COLOR]) ?
    UITableViewCellStyleValue1 : UITableViewCellStyleDefault;
    
    self = [super initWithStyle:style reuseIdentifier:RString];
    if( self ){
        
        [self initClass];
        
        if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_PICKER] )
            [self initPicker];
        
        else if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_TEXT] )
            [self initText];
        
        else if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_BUTTON] )
            [self initButton];
        
        else if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_DEFAULT] )
            [self initDefault];
        
        else if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_COLOR] )
            [self initColor];
        
        else if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_COLOR2] )
            [self initColor2];
        
        else if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_COLOR3] )
            [self initColor3];
        
        else if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_SLIDER] )
            [self initSlider];
        
        else if( [RString isEqualToString:REUSE_FUNCTIONAL_CELL_ID_TEXTFIELD] )
            [self initTextField];
        
    }
    return self;
}

- (void)initClass{
}

- (void)initText{
    self.textView = ({
        UITextView *tv = [[UITextView alloc] init];
        tv.backgroundColor = [UIColor clearColor];
        tv.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
        tv.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:tv];
        [tv.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:0].active = YES;
        [tv.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:12].active = YES;
        [tv.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-12].active = YES;
        [tv.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-0].active = YES;
        tv;
    });
}

- (void)initTextField{
    self.textField = ({
        UITextField *textField = [[UITextField alloc] init];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:textField];
        [textField.leftAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.leftAnchor].active = YES;
        [textField.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [textField.rightAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.rightAnchor].active = YES;
        [textField.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        
        textField;
    });
}


- (void)initPicker{
    self.picker = ({
        UIDatePicker *p = [[UIDatePicker alloc] init];
        p.datePickerMode = UIDatePickerModeTime;
        [p setValue:[UIColor colorWithWhite:107 / 255.0 alpha:1] forKey:@"textColor"];
        [p setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:p];
        [p.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [p.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16].active = YES;
        [p.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16].active = YES;
        [p.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        p;
    });
}

- (void)initButton{
    self.textLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
}

- (void)initDefault{
    self.textLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightLight];
    self.detailTextLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
}

- (void)initColor{    
    self.detailTextLabel.font = [UIFont MaterialDesignIconsWithSize:12];
    self.detailTextLabel.text = [UIFont mdiCheckboxBlankCircle];
}

- (void)initColor2{
    self.separatorInset = UIEdgeInsetsMake(0, 44, 0, 0);
    
    self.color2icon = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    self.color2icon.font = [UIFont MaterialDesignIconsWithSize:12];
    self.color2icon.text = [UIFont mdiCheckboxBlankCircle];
    self.color2icon.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.color2icon];
}

- (void)setColor2:(UIColor *)color2{
    _color2 = color2;
    self.color2icon.textColor = color2;
}

- (void)initColor3{
    [self initColor2];
    
    self.color2icon.font = [UIFont MaterialDesignIconsWithSize:24];
    self.textField = ({
        UITextField *textField = [[UITextField alloc] init];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:textField];
        [textField.leftAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.leftAnchor].active = YES;
        [textField.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [textField.rightAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.rightAnchor].active = YES;
        [textField.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        
        textField;
    });
}

- (void)initSlider{
    self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    self.slider = ({
        UISlider *slider = [[UISlider alloc] init];
        slider.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:slider];
        [slider.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:44].active = YES;
        [slider.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-44].active = YES;
        [slider.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        slider;
    });
    
    UILabel *small = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    small.textColor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
    small.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    small.textAlignment = NSTextAlignmentCenter;
    small.text = @"A";
    [self.contentView addSubview:small];
    
    UILabel *big   = [[UILabel alloc] init];
    big.textColor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
    big.font   = [UIFont systemFontOfSize:24 weight:UIFontWeightLight];
    big.textAlignment = NSTextAlignmentCenter;
    big.text   = @"A";
    [self.contentView addSubview:big];
    [big setTranslatesAutoresizingMaskIntoConstraints:NO];
    [big.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [big.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    [big.heightAnchor constraintEqualToConstant:44].active = YES;
    [big.widthAnchor constraintEqualToConstant:44].active = YES;
}

@end
