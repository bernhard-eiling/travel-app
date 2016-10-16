//
//  BEResultsTableViewDataSource.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "BEResultsTableViewDataSource.h"

#import "AFNetworking.h"
#import "BETravelItem.h"
#import "BETravelItemTableViewCell.h"
#import "BETravelItemViewModel.h"

@interface BEResultsTableViewDataSource ()

@property (strong, nonatomic, readwrite) NSURL *url;
@property (strong, nonatomic, readwrite) AFHTTPSessionManager *sessionManager;
@property (strong, nonatomic, readwrite) NSArray <BETravelItem *> *items;

@end

@implementation BEResultsTableViewDataSource

- (instancetype)initWithUrl:(NSURL *)url {
    self = [self init];
    if (self) {
        self.url = url;
        self.sessionManager = [AFHTTPSessionManager manager];
    }
    return self;
}

- (void)updateWithCompletionBlock:(BEUpdateCompletionBlock)completion {
    [self.sessionManager GET:self.url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject isKindOfClass:[NSArray class]]) {
            self.items = [BETravelItem travelItemsFromArray:responseObject];
            completion(YES, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(NO, error);
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BETravelItemTableViewCell *cell = (BETravelItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BETravelItemTableViewCell" forIndexPath:indexPath];
    BETravelItemViewModel *itemViewModel = [[BETravelItemViewModel alloc] initWithTravelItem:self.items[indexPath.row] andLogoSize:@"63"];
    [cell updateWithItemViewModel:itemViewModel];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

@end
