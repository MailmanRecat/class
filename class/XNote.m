//
//  XNote.m
//  class
//
//  Created by caine on 3/24/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XNote.h"

static NSString *const XKNOTE = @"X_KEY_FOR_NOTE_";

@interface XNote()

@end

@implementation XNote

+ (instancetype)noteForWeekday:(NSUInteger)weekday
{
    XNote *noteObj = [[XNote alloc] init];
    
    NSArray *note = [XNote noteObjForWeekday:weekday];
    
    return noteObj;
}

+ (NSArray  *)noteObjForWeekday:(NSUInteger)weekday
{
    return [[NSUserDefaults standardUserDefaults] arrayForKey:[XNote keyForWeekday:weekday]];
}

+ (NSString *)keyForWeekday:(NSUInteger)weekday
{
    return [NSString stringWithFormat:@"%@%ld", XKNOTE, weekday];
}

@end
