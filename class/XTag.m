//
//  XTag.m
//  class
//
//  Created by caine on 3/23/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "XTag.h"
#import "UIFont+MaterialDesignIcons.h"

@implementation XTag

- (instancetype)initWithTagType:(XTagType)type
{
    self = [super init];
    if( self )
    {
        NSDictionary<NSString *, NSArray *> *tags = @{
                               @"1" : @[ [UIFont mdiFlag],            [XTag R:255 G:86  B:33] ],
                               @"2" : @[ [UIFont mdiFlagOutline],     [XTag R:255 G:86  B:33] ],
                               @"3" : @[ [UIFont mdiAccountMultiple], [XTag R:209 G:62  B:48] ],
                               @"4" : @[ [UIFont mdiTrophy],          [XTag R:255 G:215 B:1] ],
                               @"5" : @[ [UIFont mdiTrophyAward],     [XTag R:121 G:85  B:72] ],
                               @"6" : @[ [UIFont mdiForum],           [XTag R:56  G:72  B:170] ],
                               @"7" : @[ [UIFont mdiTag],             [XTag R:0   G:151 B:167] ],
                               @"8" : @[ [UIFont mdiHeart],           [XTag R:250 G:17  B:79] ],
                               @"9" : @[ [UIFont mdiHeartOutline],    [XTag R:250 G:17  B:79] ],
                               @"10": @[ [UIFont mdiLightbulb],       [XTag R:245 G:190 B:59] ],
                               @"11": @[ [UIFont mdiEmoticon],        [XTag R:250 G:17  B:79] ],
                               @"12": @[ [UIFont mdiChartLine],       [XTag R:102 G:157 B:54] ],
                               @"13": @[ [UIFont mdiFoodApple],       [XTag R:250 G:17  B:79] ],
                               @"14": @[ [UIFont mdiShapePlus],       [XTag R:23  G:127 B:69] ],
                               @"15": @[ [UIFont mdiStar],            [XTag R:0   G:118 B:255] ],
                               @"16": @[ [UIFont mdiPalette],         [XTag R:113 G:28  B:128] ]
                               };
        
        NSArray *t = [tags valueForKey:[NSNumber numberWithInteger:type].stringValue];
        self.type  = type;
        self.tag   = t.firstObject;
        self.color = t.lastObject;
    }
    return self;
}

+ (UIColor *)R:(NSUInteger)r G:(NSUInteger)g B:(NSUInteger)b
{
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1];
}

@end
