//
//  BEResultsTableViewController.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "BEResultsViewController.h"

#import "BEResultsTableViewDataSource.h"

@interface BEResultsViewController ()

@property (strong, nonatomic, readwrite) NSURL *url;
@property (strong, nonatomic, readwrite) BEResultsTableViewDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *orderSegmentedControl;

@end

@implementation BEResultsViewController

- (instancetype)initWithUrl:(NSURL *)url {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [mainStoryboard instantiateViewControllerWithIdentifier:@"BEResultsViewController"];
    if (self) {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.orderSegmentedControl addTarget:self action:@selector(orderChange:) forControlEvents:UIControlEventValueChanged];
    self.tableView.rowHeight = 100;
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerNib:[UINib nibWithNibName:@"BETravelItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"BETravelItemTableViewCell"];
    [self.dataSource updateWithCompletionBlock:^(BOOL success, NSError *error) {
        if (success) {
            [self.tableView reloadData];
        }
    }];
}

- (void)orderChange:(id)sender {
    self.dataSource.orderType = (int)self.orderSegmentedControl.selectedSegmentIndex;
    [self.tableView reloadData];
}

#pragma mark lazy instantiation

- (BEResultsTableViewDataSource *)dataSource {
    if (!_dataSource) {
        self.dataSource = [[BEResultsTableViewDataSource alloc] initWithUrl:self.url];
    }
    return _dataSource;
}

@end
