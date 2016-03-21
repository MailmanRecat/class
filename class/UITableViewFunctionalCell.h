//
//  UITableViewCellWithPicker.h
//  CRTestingProject
//
//  Created by caine on 1/13/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const REUSE_FUNCTIONAL_CELL_ID_PICKER  = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_PICKER";
static NSString *const REUSE_FUNCTIONAL_CELL_ID_TEXT    = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_TEXT";
static NSString *const REUSE_FUNCTIONAL_CELL_ID_BUTTON  = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_BUTTON";
static NSString *const REUSE_FUNCTIONAL_CELL_ID_DEFAULT = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_DEFAULT";
static NSString *const REUSE_FUNCTIONAL_CELL_ID_COLOR   = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_COLOR";
static NSString *const REUSE_FUNCTIONAL_CELL_ID_COLOR2  = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_COLOR2";
static NSString *const REUSE_FUNCTIONAL_CELL_ID_COLOR3  = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_COLOR3";
static NSString *const REUSE_FUNCTIONAL_CELL_ID_TEXTFIELD = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_TEXTFIELD";
static NSString *const REUSE_FUNCTIONAL_CELL_ID_SLIDER  = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_SLIDER";

@interface UITableViewFunctionalCell : UITableViewCell

@property( nonatomic, strong ) UITextView   *textView;
@property( nonatomic, strong ) UITextField  *textField;
@property( nonatomic, strong ) UIPickerView *picker;
@property( nonatomic, strong ) UISlider     *slider;
@property( nonatomic, strong ) UIButton     *button;

//For color2
@property( nonatomic, strong ) UIColor      *color2;

- (instancetype)initWithReuseString:(NSString *)RString;

@end
