//
//  BETravelItemTableViewCell.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "BETravelItemTableViewCell.h"

#import "BETravelItemViewModel.h"
#import "UIImageView+WebCache.h"

@interface BETravelItemTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *departureArrivalLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *stopsLabel;

@end

@implementation BETravelItemTableViewCell

- (void)updateWithItemViewModel:(BETravelItemViewModel *)itemViewModel {
    self.departureArrivalLabel.text = itemViewModel.departureArrivalString;
    self.priceLabel.text = itemViewModel.priceString;
    self.durationLabel.text = itemViewModel.durationString;
    self.stopsLabel.text = itemViewModel.stopsString;
    [self.logoImageView sd_setImageWithURL:itemViewModel.logoUrl placeholderImage:nil options:SDWebImageRefreshCached];
}

@end
