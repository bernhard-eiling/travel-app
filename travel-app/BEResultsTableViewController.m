//
//  BEResultsTableViewController.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "BEResultsTableViewController.h"

#import "BEResultsTableViewDataSource.h"

@interface BEResultsTableViewController ()

@property (strong, nonatomic, readwrite) NSURL *url;
@property (strong, nonatomic, readwrite) BEResultsTableViewDataSource *dataSource;

@end

@implementation BEResultsTableViewController

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerNib:[UINib nibWithNibName:@"BETravelItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"BETravelItemTableViewCell"];
    [self.dataSource updateWithCompletionBlock:^(BOOL success, NSError *error) {
        if (success) {
            [self.tableView reloadData];
        }
    }];
}


#pragma mark lazy instantiation

- (BEResultsTableViewDataSource *)dataSource {
    if (!_dataSource) {
        self.dataSource = [[BEResultsTableViewDataSource alloc] initWithUrl:self.url];
    }
    return _dataSource;
}

@end
