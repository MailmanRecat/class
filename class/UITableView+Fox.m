//
//  UITableView+Fox.m
//  Chart
//
//  Created by caine on 3/10/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "UITableView+Fox.h"

@implementation UITableView (Fox)

- (UITableViewCell *)dequeueDefaultColorReusebleCell
{
    UITableViewFunctionalCell *RC = [self dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_CELL_ID_COLOR];
    if( RC == nil )
    {
        RC = [[UITableViewFunctionalCell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_COLOR];
        RC.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return RC;
}

- (UITableViewFunctionalCell *)deququeDefaultDatePickerReusebleCell
{
    UITableViewFunctionalCell *PC = [self dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_CELL_ID_PICKER];
    if( PC == nil )
    {
        PC = [[UITableViewFunctionalCell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_PICKER];
    }
    return PC;
}

- (UITableViewFunctionalCell *)dequeueDefaultColor2ReusebleCell
{
    UITableViewFunctionalCell *RC = [self dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_CELL_ID_COLOR2];
    if( RC == nil )
    {
        RC = [[UITableViewFunctionalCell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_COLOR2];
    }
    return RC;
}

- (UITableViewCell *)dequeueDefaultReusebleCell
{
    UITableViewCell *RC = [self dequeueReusableCellWithIdentifier:@"FUCK_DEFAULT"];
    if( RC == nil )
        RC = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"FUCK_DEFAULT"];
    
    return RC;
}

- (UITableViewFunctional2Cell *)dequeueDefaultSwitchReusebleCell
{
    UITableViewFunctional2Cell *RC = [self dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_CELL_ID_SWITCH];
    if( RC == nil )
    {
        RC = [[UITableViewFunctional2Cell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_SWITCH];
    }
    return RC;
}

- (UITableViewFunctional2Cell *)dequeueDefaultBIGImageReusebleCell
{
    UITableViewFunctional2Cell *RC = [self dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_CELL_ID_BIGIMAGE];
    if( RC == nil )
    {
        RC = [[UITableViewFunctional2Cell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_BIGIMAGE];
    }
    return RC;
}

- (UITableViewCell *)dequeueReusebleCellWithText:(NSString *)text textColor:(UIColor *)textColor type:(UITableViewCellAccessoryType)type
{
    UITableViewCell *RC = [self dequeueReusableCellWithIdentifier:@"FUCK_BUTTON"];
    if( RC == nil )
        RC = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FUCK_BUTTON"];
    
    RC.textLabel.text = text;
    RC.textLabel.textColor = textColor;
    RC.accessoryType = type;
    
    return RC;
}

- (UITableViewFunctionalXCell *)dequeueXBorderReusebleCell
{
    UITableViewFunctionalXCell *XC = [self dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_X_CELL_ID_BORDER];
    if( XC == nil )
    {
        XC = [[UITableViewFunctionalXCell alloc] initWithReuseString:REUSE_FUNCTIONAL_X_CELL_ID_BORDER];
        XC.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return XC;
}

- (UITableSegmentHeaderView  *)dequeueSegmentHeaderReusebleCell
{
    UITableSegmentHeaderView *SH = [self dequeueReusableHeaderFooterViewWithIdentifier:UITableSegmentHeaderViewReuseID];
    if( SH == nil )
    {
        SH = [[UITableSegmentHeaderView alloc] initWithReuseIdentifier:UITableSegmentHeaderViewReuseID];
    }
    return SH;
}

- (UITableViewHeaderFooterView *)dequeueDefaultHeaderFooterViewThenText:(NSString *)text
{
    UITableViewHeaderFooterView *HF = [self dequeueReusableHeaderFooterViewWithIdentifier:@"FUCK_HF_DEFAULT"];
    if( HF == nil )
        HF = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"FUCK_HF_DEFAULT"];
    
    HF.textLabel.text = text;
    
    return HF;
}

- (BOOL)isDirtyEqual:(NSIndexPath *)indexPath1 toIndexPath:(NSIndexPath *)indexPath2
{
    return indexPath1.row == indexPath2.row && indexPath1.section == indexPath2.section;
}

- (BOOL)isTargetTableViewCellAtIndexPath:(NSIndexPath *)indexPath equalToString:(NSString *)string{
    return [[self cellForRowAtIndexPath:indexPath].textLabel.text.lowercaseString isEqualToString:string];
}

- (BOOL)isTargetTableViewCellAtIndexPath:(NSIndexPath *)indexPath equalToTag:(NSInteger)tag{
    return [self cellForRowAtIndexPath:indexPath].tag == tag;
}

- (BOOL)isThdLastRow:(NSIndexPath *)indexPath{
    return indexPath.row == [self numberOfRowsInSection:indexPath.section] - 3;
}

- (BOOL)isSecLastRow:(NSIndexPath *)indexPath{
    return indexPath.row == [self numberOfRowsInSection:indexPath.section] - 2;
}

- (BOOL)isLastRow:(NSIndexPath *)indexPath{
    return indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1;
}

- (BOOL)isSecLastSection:(NSInteger)section{
    return section == [self numberOfSections] - 2;
}

- (BOOL)isLastSection:(NSInteger)section{
    return section == [self numberOfSections] - 1;
}

@end