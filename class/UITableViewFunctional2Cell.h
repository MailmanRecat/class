//
//  UITableViewFunctional2Cell.h
//  Chart
//
//  Created by caine on 3/7/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const REUSE_FUNCTIONAL_CELL_ID_SWITCH   = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_SWITCH";
static NSString *const REUSE_FUNCTIONAL_CELL_ID_BIGIMAGE = @"UITABLEVIEW_REUSE_FUNCTIONAL_CELL_ID_BIGIMAGE";

@interface UITableViewFunctional2Cell : UITableViewCell

@property( nonatomic, strong ) UISwitch *toggle;

@property( nonatomic, strong ) UILabel         *BMName;
@property( nonatomic, strong ) UILabel         *BMTime;
@property( nonatomic, strong ) UIImageView     *bigImageView;

- (instancetype)initWithReuseString:(NSString *)RString;

@end
