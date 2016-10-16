//
//  NSDictionary+SaveParser.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "NSDictionary+SaveParser.h"

@implementation NSDictionary (SaveParser)

- (NSNumber *)numberWithKey:(NSString *)key {
    id value = self[key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSString class]]) {
        return [self numberFromString:value];
    }
    return nil;
}

- (NSNumber *)numberFromString:(NSString *)string {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = kCFNumberFormatterDecimalStyle;
    numberFormatter.decimalSeparator = @".";
    return [numberFormatter numberFromString:string];
}

@end
