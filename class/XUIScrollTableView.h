//
//  XUIScrollTableView.h
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XUIScrollTableViewDelegate;

@interface XUIScrollTableView : UIScrollView

@property( nonatomic, weak   ) id<XUIScrollTableViewDelegate>    xdelegate;

@property( nonatomic, strong ) UITableView                      *tleft;
@property( nonatomic, strong ) UITableView                      *tcenter;
@property( nonatomic, strong ) UITableView                      *tright;

@end

@protocol XUIScrollTableViewDelegate <NSObject>

- (void)xscrollViewDidScroll:(UIScrollView *)scrollView;

@end
