//
//  XSearchFieldViewController.h
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XBasicViewController.h"

@interface XSearchCache : NSObject

+ (NSMutableArray *)searchHistory:(NSString *)keyword;

+ (void)deleteForIndex:(NSUInteger)index history:(NSString *)history;

+ (void)clear:(NSString *)history;

@end

@interface XSearchFieldViewController : XBasicViewController

@property( nonatomic, strong ) NSMutableArray<NSString *>       *history;
@property( nonatomic, copy   ) NSString                         *placeholderString;

@end
