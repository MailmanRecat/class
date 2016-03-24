//
//  NSString+craig.h
//  Chart
//
//  Created by caine on 3/8/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (craig)

- (NSString *)toSmallCamelCase;
- (NSString *)toBigCamelCase;
- (NSString *)toTextCaseFromCamaCase;
- (NSString *)toDisplayCaseFromCamaCase;

- (NSString *)toPureNumber;

- (NSString *)stringRemoveEdgeSpace;

@end
