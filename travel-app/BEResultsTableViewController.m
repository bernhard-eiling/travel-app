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
    self.tableView.dataSource = self.dataSource;
    [self.dataSource update];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

- (BEResultsTableViewDataSource *)dataSource {
    if (!_dataSource) {
        self.dataSource = [[BEResultsTableViewDataSource alloc] initWithUrl:self.url];
    }
    return _dataSource;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
