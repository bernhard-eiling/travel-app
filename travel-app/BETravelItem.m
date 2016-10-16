//
//  BETravelItem.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "BETravelItem.h"

#import <Foundation/Foundation.h>
#import "NSDictionary+SaveParser.h"

@interface BETravelItem ()

@property (copy, nonatomic, readwrite) NSString *identifier;
@property (copy, nonatomic, readwrite) NSString *logoTemplateUrlString;
@property (copy, nonatomic, readwrite) NSNumber *priceEuro;
@property (copy, nonatomic, readwrite) NSDate *departureDate;
@property (copy, nonatomic, readwrite) NSDate *arrivalDate;
@property (copy, nonatomic, readwrite) NSNumber *numberStops;

@end

@implementation BETravelItem

+ (NSArray <BETravelItem *>*)travelItemsFromArray:(NSArray *)array {
    NSMutableArray *items = [NSMutableArray new];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            BETravelItem *item = [[BETravelItem alloc] initWithDictionary:obj];
            if (item) {
                [items addObject:item];
            }
        }
    }];
    return items;
}

- (instancetype)initWithDictionary:(NSDictionary *)dataDictionary {
    self = [super init];
    if (self) {
        self.identifier = dataDictionary[@"id"];
        self.logoTemplateUrlString = dataDictionary[@"provider_logo"];
        self.priceEuro = [dataDictionary numberWithKey:@"price_in_euros"];
        self.departureDate = [self.class.dateFormatter dateFromString:dataDictionary[@"departure_time"]];
        self.arrivalDate = [self.class.dateFormatter dateFromString:dataDictionary[@"arrival_time"]];
        self.numberStops = [dataDictionary numberWithKey:@"number_of_stops"];
    }
    return self;
}

+ (NSDateFormatter *)dateFormatter {
    static dispatch_once_t dateFormatterOnceToken;
    static NSDateFormatter *dateFormatter;
    dispatch_once(&dateFormatterOnceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
    });
    return dateFormatter;
}

@end
