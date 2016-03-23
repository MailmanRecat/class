//
//  XTag.h
//  class
//
//  Created by caine on 3/23/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XTagType)
{
    XTagTypeFlag = 0,
    XTagTypeFlagOutline,
    XTagTypeAccount,
    XTagTypeTrophy,
    XTagTypeTrophyAward,
    XTagTypeFroum,
    XTagTypeTag,
    XTagTypeHeart,
    XTagTypeHeartOutline,
    XTagTypelightbulb,
    XTagTypeEmoticon,
    XTagTypeChartLine,
    XTagTypeFoodApple,
    XTagTypeShapePlus,
    XTagTypeStar,
    XTagTypePalette
};

@interface XTag : NSObject

@property( nonatomic, assign ) XTagType                  type;
@property( nonatomic, strong ) NSString                 *tag;
@property( nonatomic, strong ) UIColor                  *color;

@end
