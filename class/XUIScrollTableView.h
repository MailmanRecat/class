//
//  XUIScrollTableView.h
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XUIScrollTableView : UIScrollView

@property( nonatomic, strong ) UITableView *tleft;
@property( nonatomic, strong ) UITableView *tcenter;
@property( nonatomic, strong ) UITableView *tright;

@end
