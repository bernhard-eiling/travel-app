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

- (void)update {
    [self.sessionManager GET:self.url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject isKindOfClass:[NSArray class]]) {
            self.items = [BETravelItem travelItemsFromArray:responseObject];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
