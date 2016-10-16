//
//  BEResultsTableViewDataSource.h
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BETravelItem;

typedef enum {
    BEOrderTypeDepartureTime,
    BEOrderTypeArrivalTime,
    BEOrderTypeDuration,
} BEOrderType;

typedef void (^BEUpdateCompletionBlock)(BOOL success, NSError *error);

@interface BEResultsTableViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic, readonly) NSArray <BETravelItem *> *items;
@property (nonatomic, readwrite) BEOrderType orderType;

- (instancetype)initWithUrl:(NSURL *)url;
- (void)updateWithCompletionBlock:(BEUpdateCompletionBlock)completion;

@end
