//
//  XNavigationController.m
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XNavigationController.h"

@implementation XNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if( self )
    {
        self.navigationBarHidden = YES;
        self.toolbarHidden = YES;
    }
    return self;
}

@end
