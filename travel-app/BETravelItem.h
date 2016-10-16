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
@property (copy, nonatomic, readonly) NSString *logoTemplateUrlString;
@property (copy, nonatomic, readonly) NSNumber *priceEuro;
@property (copy, nonatomic, readonly) NSDate *departureDate;
@property (copy, nonatomic, readonly) NSDate *arrivalDate;
@property (copy, nonatomic, readonly) NSNumber *numberStops;
@property (nonatomic, readonly) NSTimeInterval duration;

+ (NSArray <BETravelItem *> *)travelItemsFromArray:(NSArray *)array;
- (instancetype)initWithDictionary:(NSDictionary *)dataDictionary;

@end
