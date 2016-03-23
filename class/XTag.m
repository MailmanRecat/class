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
                               @"0" : @[ [UIFont mdiFlag],            [XTag R:255 G:86  B:33] ],
                               @"1" : @[ [UIFont mdiFlagOutline],     [XTag R:255 G:86  B:33] ],
                               @"2" : @[ [UIFont mdiAccountMultiple], [XTag R:209 G:62  B:48] ],
                               @"3" : @[ [UIFont mdiTrophy],          [XTag R:255 G:215 B:1] ],
                               @"4" : @[ [UIFont mdiTrophyAward],     [XTag R:121 G:85  B:72] ],
                               @"5" : @[ [UIFont mdiForum],           [XTag R:56  G:72  B:170] ],
                               @"6" : @[ [UIFont mdiTag],             [XTag R:0   G:151 B:167] ],
                               @"7" : @[ [UIFont mdiHeart],           [XTag R:250 G:17  B:79] ],
                               @"8" : @[ [UIFont mdiHeartOutline],    [XTag R:250 G:17  B:79] ],
                               @"9" : @[ [UIFont mdiLightbulb],       [XTag R:245 G:190 B:59] ],
                               @"10": @[ [UIFont mdiEmoticon],        [XTag R:250 G:17  B:79] ],
                               @"11": @[ [UIFont mdiChartLine],       [XTag R:102 G:157 B:54] ],
                               @"12": @[ [UIFont mdiFoodApple],       [XTag R:250 G:17  B:79] ],
                               @"13": @[ [UIFont mdiShapePlus],       [XTag R:23  G:127 B:69] ],
                               @"14": @[ [UIFont mdiStar],            [XTag R:0   G:118 B:255] ],
                               @"15": @[ [UIFont mdiPalette],         [XTag R:113 G:28  B:128] ]
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
