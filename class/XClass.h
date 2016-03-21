//
//  XClass.h
//  class
//
//  Created by caine on 3/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XClass : NSObject

@property( nonatomic, assign ) NSInteger                          *weekday;
@property( nonatomic, copy   ) NSString                           *course;
@property( nonatomic, copy   ) NSString                           *location;
@property( nonatomic, copy   ) NSString                           *teacher;
@property( nonatomic, copy   ) NSString                           *start;
@property( nonatomic, copy   ) NSString                           *end;
@property( nonatomic, copy   ) NSString                           *tag;

@end
