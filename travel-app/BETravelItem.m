//
//  BETravelItem.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "BETravelItem.h"

@interface BETravelItem ()

@property (copy, nonatomic, readwrite) NSString *identifier;
@property (copy, nonatomic, readwrite) NSURL *logoUrl;
@property (copy, nonatomic, readwrite) NSNumber *priceEuro;
@property (copy, nonatomic, readwrite) NSString *departureTime;
@property (copy, nonatomic, readwrite) NSString *arrivalTime;
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
        self.logoUrl = dataDictionary[@"provider_logo"];
        self.priceEuro = dataDictionary[@"price_in_euros"];
        self.departureTime = dataDictionary[@"departure_time"];
        self.arrivalTime = dataDictionary[@"arrival_time"];
        self.numberStops = dataDictionary[@"number_of_stops"];
    }
    return self;
}

@end
