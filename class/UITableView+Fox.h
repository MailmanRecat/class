//
//  UITableView+Fox.h
//  Chart
//
//  Created by caine on 3/10/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewFunctionalCell.h"
#import "UITableViewFunctional2Cell.h"

@interface UITableView (Fox)

- (UITableViewCell *)dequeueDefaultReusebleCell;
- (UITableViewFunctionalCell *)dequeueDefaultColorReusebleCell;
- (UITableViewFunctionalCell *)dequeueDefaultColor2ReusebleCell;
- (UITableViewFunctional2Cell *)dequeueDefaultSwitchReusebleCell;
- (UITableViewFunctional2Cell *)dequeueDefaultBIGImageReusebleCell;
- (UITableViewCell *)dequeueReusebleCellWithText:(NSString *)text textColor:(UIColor *)textColor type:(UITableViewCellAccessoryType)type;

- (UITableViewHeaderFooterView *)dequeueDefaultHeaderFooterViewThenText:(NSString *)text;

- (BOOL)isTargetTableViewCellAtIndexPath:(NSIndexPath *)indexPath equalToString:(NSString *)string;
- (BOOL)isTargetTableViewCellAtIndexPath:(NSIndexPath *)indexPath equalToTag:(NSInteger)tag;

- (BOOL)isThdLastRow:(NSIndexPath *)indexPath;
- (BOOL)isSecLastRow:(NSIndexPath *)indexPath;
- (BOOL)isLastRow:(NSIndexPath *)indexPath;

- (BOOL)isSecLastSection:(NSInteger)section;
- (BOOL)isLastSection:(NSInteger)section;

@end
