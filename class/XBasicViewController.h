//
//  XBasicViewController.h
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#define STATUS_BAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define X_SVFW self.view.frame.size.width
#define X_SVFH self.view.frame.size.height

#import <UIKit/UIKit.h>

#import "XClass.h"

#import "NSString+craig.h"
#import "UIView+XUIView.h"
#import "UIFont+MaterialDesignIcons.h"
#import "UITableView+Fox.h"

#import "XNavigationController.h"

@interface XBasicViewController : UIViewController

- (void)dismissSelf;

- (void)selfViewLayoutIfNeed;

@end
