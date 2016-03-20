//
//  XUIDrawerView.h
//  class
//
//  Created by caine on 3/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XUIDrawerViewDelegate;

@interface XUIDrawerView : UIView

- (instancetype)initWithItems:(NSArray<NSAttributedString *> *)items;

- (void)openDrawer;

@end


@protocol XUIDrawerViewDelegate <NSObject>



@end