//
//  UITableViewFunctionalXCell.h
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const REUSE_FUNCTIONAL_X_CELL_ID_BORDER   = @"UITABLEVIEW_REUSE_FUNCTIONAL_X_CELL_ID_BORDER";

@interface UITableViewFunctionalXCell : UITableViewCell

@property( nonatomic, assign ) BOOL                 useBorder;

- (instancetype)initWithReuseString:(NSString *)RString;

@end
