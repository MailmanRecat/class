//
//  NSString+craig.m
//  Chart
//
//  Created by caine on 3/8/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "NSString+craig.h"

@implementation NSString (craig)

- (NSString *)toBigCamelCase{
    NSString *result;
    
    result = [self capitalizedString];
    result = [result stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return result;
}

- (NSString *)toSmallCamelCase{
    NSString *result;
    
    result = [self capitalizedString];
    result = [result stringByReplacingOccurrencesOfString:@" " withString:@""];
    result = [result stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[result substringToIndex:1] lowercaseString]];
    
    return result;
}

- (NSString *)toTextCaseFromCamaCase{
    NSMutableString *displayText = [NSMutableString string];
    NSCharacterSet  *upc = [NSCharacterSet uppercaseLetterCharacterSet];
    for( NSUInteger idx = 0; idx < self.length; idx++ ){
        unichar c = [self characterAtIndex:idx];
        if( [upc characterIsMember:c] )
            [displayText appendFormat:@"%@%@", (idx == 0 ? @"" : @" "), [[NSString stringWithCharacters:&c length:1] lowercaseString]];
        else
            [displayText appendFormat:@"%C", c];
    }
    
    return [displayText stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[displayText substringToIndex:1] uppercaseString]];
}

- (NSString *)toDisplayCaseFromCamaCase{
    NSMutableString *displayText = [NSMutableString string];
    NSCharacterSet  *upc = [NSCharacterSet uppercaseLetterCharacterSet];
    for( NSUInteger idx = 0; idx < self.length; idx++ ){
        unichar c = [self characterAtIndex:idx];
        if( [upc characterIsMember:c] )
            [displayText appendFormat:@"%@%@", (idx == 0 ? @"" : @" "), [[NSString stringWithCharacters:&c length:1] uppercaseString]];
        else
            [displayText appendFormat:@"%C", c];
    }
    
    return [displayText stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[displayText substringToIndex:1] uppercaseString]];
}

- (NSString *)toPureNumber
{
    NSString *set          = [self componentsSeparatedByString:@"."].count > 2 ? @"0123456789" : @".0123456789";
    NSCharacterSet *target = [[NSCharacterSet characterSetWithCharactersInString:set] invertedSet];
    NSString       *number = [[[self stringByReplacingOccurrencesOfString:@" " withString:@""] componentsSeparatedByCharactersInSet:target] componentsJoinedByString:@""];
    return number.length != 0 ? [number hasSuffix:@"."] ? [NSString stringWithFormat:@"%@0", number] : number : @"0";
}

- (NSString *)stringRemoveEdgeSpace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
