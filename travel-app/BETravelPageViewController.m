//
//  BETravelPageViewController.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "BETravelPageViewController.h"

#import "BEResultsTableViewController.h"

@interface BETravelPageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (strong, nonatomic, readwrite) UIPageViewController *pageViewController;
@property (strong, nonatomic, readwrite) NSArray<BEResultsTableViewController *> *resultsTableViewControllers;

@end

@implementation BETravelPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController setViewControllers:@[self.resultsTableViewControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

#pragma mark UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(BEResultsTableViewController *)viewController {
    NSUInteger currentIndex = [self indexOfViewController:viewController];
    return [self viewControllerForIndex:currentIndex - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(BEResultsTableViewController *)viewController {
    NSUInteger currentIndex = [self indexOfViewController:viewController];
    return [self viewControllerForIndex:currentIndex + 1];
}

- (BEResultsTableViewController *)viewControllerForIndex:(NSUInteger)index {
    if (self.resultsTableViewControllers.count <= 0) {
        return nil;
    }
    if (index >= self.resultsTableViewControllers.count) {
        return nil;
    }
    return self.resultsTableViewControllers[index];
}

- (NSUInteger)indexOfViewController:(BEResultsTableViewController *)viewController {
    return [self.resultsTableViewControllers indexOfObject:viewController];
}

#pragma mark lazy instantiation

- (NSArray<BEResultsTableViewController *> *)resultsTableViewControllers {
    if (!_resultsTableViewControllers) {
        _resultsTableViewControllers = @[[[BEResultsTableViewController alloc] initWithUrl:[NSURL URLWithString:@"https://api.myjson.com/bins/w60i"]],
                                         [[BEResultsTableViewController alloc] initWithUrl:[NSURL URLWithString:@"https://api.myjson.com/bins/3zmcy"]],
                                         [[BEResultsTableViewController alloc] initWithUrl:[NSURL URLWithString:@"https://api.myjson.com/bins/37yzm"]]
                                         ];
    }
    return _resultsTableViewControllers;
}

- (UIPageViewController *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        [self addChildViewController:_pageViewController];
        [_pageViewController didMoveToParentViewController:self];
        _pageViewController.dataSource = self;
        _pageViewController.delegate = self;
    }
    return _pageViewController;
}

@end
