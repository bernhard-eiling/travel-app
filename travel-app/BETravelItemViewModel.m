//
//  BETravelItemViewModel.m
//  travel-app
//
//  Created by Bernhard Eiling on 16.10.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

#import "BETravelItemViewModel.h"

#import "BETravelItem.h"

@interface BETravelItemViewModel ()

@property (copy, nonatomic, readwrite) NSURL *logoUrl;
@property (copy, nonatomic, readwrite) NSString *departureArrivalString;
@property (copy, nonatomic, readwrite) NSString *priceString;
@property (copy, nonatomic, readwrite) NSString *durationString;
@property (copy, nonatomic, readwrite) NSString *stopsString;

@property (strong, nonatomic, readwrite) BETravelItem *travelItem;
@property (strong, nonatomic, readwrite) NSString *size;

@end

@implementation BETravelItemViewModel

- (instancetype)initWithTravelItem:(BETravelItem *)travelItem andLogoSize:(NSString *)size {
    self = [super init];
    if (self) {
        self.travelItem = travelItem;
        self.size = size;
    }
    return self;
}

- (NSURL *)logoUrl {
    NSMutableString *logoUrlString = self.travelItem.logoTemplateUrlString.mutableCopy;
    [logoUrlString replaceOccurrencesOfString:@"{size}" withString:self.size options:NSCaseInsensitiveSearch range:NSMakeRange(0, logoUrlString.length)];
    return [NSURL URLWithString:logoUrlString];
}

- (NSString *)departureArrivalString {
    if (!self.travelItem.departureDate || !self.travelItem.arrivalDate) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@ - %@", [self.class.dateFormatter stringFromDate:self.travelItem.departureDate], [self.class.dateFormatter stringFromDate:self.travelItem.arrivalDate]];
}

- (NSString *)priceString {
    if (!self.travelItem.priceEuro) {
        return @"";
    }
    return  [NSString stringWithFormat:@"€%@", [self.class.numberFormatter stringFromNumber:self.travelItem.priceEuro]];
}

- (NSString *)durationString {
    if (!self.travelItem.departureDate || !self.travelItem.arrivalDate) {
        return @"";
    }
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:self.travelItem.departureDate toDate:self.travelItem.arrivalDate options:0];
    return [NSString stringWithFormat:@"%li:%lih", components.hour, components.minute];
}

- (NSString *)stopsString {
    if (!self.travelItem.numberStops) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"travel.stops", nil) ,self.travelItem.numberStops];
}

+ (NSNumberFormatter *)numberFormatter {
    static dispatch_once_t numberFormatterOnceToken;
    static NSNumberFormatter *numberFormatter;
    dispatch_once(&numberFormatterOnceToken, ^{
        numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = kCFNumberFormatterDecimalStyle;
        numberFormatter.minimumFractionDigits = 2;
    });
    return numberFormatter;
}

+ (NSDateFormatter *)dateFormatter {
    static dispatch_once_t dateFormatterOnceToken;
    static NSDateFormatter *dateFormatter;
    dispatch_once(&dateFormatterOnceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
    });
    return dateFormatter;
}


@end
