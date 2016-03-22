//
//  XClassEdtingViewController.h
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XBasicViewController.h"

typedef NS_ENUM(NSUInteger, XClassEdtingModel)
{
    XClassEdtingModelDisplay = 0,
    XClassEdtingModelDefault
};

@interface XClassEdtingViewController : XBasicViewController

@property( nonatomic, assign ) XClassEdtingModel                    displayModel;

- (instancetype)initWithXClass:(XClass *)XClass model:(XClassEdtingModel)model;

@end
