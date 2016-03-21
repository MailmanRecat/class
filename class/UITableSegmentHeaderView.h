//
//  UITableSegmentHeaderView.h
//  class
//
//  Created by caine on 3/22/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const UITableSegmentHeaderViewReuseID = @"UITABLE_SEGMENT_HEADER_VIEW_REUSER_ID";

@interface UITableSegmentHeaderView : UITableViewHeaderFooterView

@property( nonatomic, strong ) UISegmentedControl *segmentControl;

@end
