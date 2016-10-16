//
//  BETravelPageViewController.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "BETravelPageViewController.h"

#import "BEResultsViewController.h"

@interface BETravelPageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (strong, nonatomic, readwrite) UIPageViewController *pageViewController;
@property (strong, nonatomic, readwrite) NSArray<BEResultsViewController *> *resultsViewControllers;

@end

@implementation BETravelPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController setViewControllers:@[self.resultsViewControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

#pragma mark UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(BEResultsViewController *)viewController {
    NSUInteger currentIndex = [self indexOfViewController:viewController];
    return [self viewControllerForIndex:currentIndex - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(BEResultsViewController *)viewController {
    NSUInteger currentIndex = [self indexOfViewController:viewController];
    return [self viewControllerForIndex:currentIndex + 1];
}

- (BEResultsViewController *)viewControllerForIndex:(NSUInteger)index {
    if (self.resultsViewControllers.count <= 0) {
        return nil;
    }
    if (index >= self.resultsViewControllers.count) {
        return nil;
    }
    return self.resultsViewControllers[index];
}

- (NSUInteger)indexOfViewController:(BEResultsViewController *)viewController {
    return [self.resultsViewControllers indexOfObject:viewController];
}

#pragma mark lazy instantiation

- (NSArray<BEResultsViewController *> *)resultsViewControllers {
    if (!_resultsViewControllers) {
        _resultsViewControllers = @[[[BEResultsViewController alloc] initWithUrl:[NSURL URLWithString:@"https://api.myjson.com/bins/w60i"]],
                                    [[BEResultsViewController alloc] initWithUrl:[NSURL URLWithString:@"https://api.myjson.com/bins/3zmcy"]],
                                    [[BEResultsViewController alloc] initWithUrl:[NSURL URLWithString:@"https://api.myjson.com/bins/37yzm"]]
                                         ];
    }
    return _resultsViewControllers;
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
