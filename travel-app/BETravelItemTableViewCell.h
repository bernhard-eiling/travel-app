//
//  BETravelItemTableViewCell.h
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BETravelItemViewModel;

@interface BETravelItemTableViewCell : UITableViewCell

- (void)updateWithItemViewModel:(BETravelItemViewModel *)itemViewModel;

@end
