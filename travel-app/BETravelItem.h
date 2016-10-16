//
//  BETravelItem.h
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BETravelItem : NSObject

@property (copy, nonatomic, readonly) NSString *identifier;
@property (copy, nonatomic, readonly) NSURL *logoUrl;
@property (copy, nonatomic, readonly) NSNumber *priceEuro;
@property (copy, nonatomic, readonly) NSString *departureDate;
@property (copy, nonatomic, readonly) NSString *arrivalDate;
@property (copy, nonatomic, readonly) NSNumber *numberStops;

+ (NSArray <BETravelItem *> *)travelItemsFromArray:(NSArray *)array;
- (instancetype)initWithDictionary:(NSDictionary *)dataDictionary;

@end
