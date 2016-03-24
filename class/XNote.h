//
//  XNote.h
//  class
//
//  Created by caine on 3/24/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XNote : NSObject

@property( nonatomic, copy ) NSString                   *title;
@property( nonatomic, copy ) NSString                   *content;

+ (instancetype)noteForWeekday:(NSUInteger)weekday;

@end
