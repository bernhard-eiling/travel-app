//
//  BETravelItemViewModel.h
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BETravelItem;

@interface BETravelItemViewModel : NSObject

@property (copy, nonatomic, readonly) NSURL *logoUrl;
@property (copy, nonatomic, readonly) NSString *departureArrivalString;
@property (copy, nonatomic, readonly) NSString *priceString;
@property (copy, nonatomic, readonly) NSString *durationString;
@property (copy, nonatomic, readonly) NSString *stopsString;

- (instancetype)initWithTravelItem:(BETravelItem *)travelItem andLogoSize:(NSString *)size;

@end
