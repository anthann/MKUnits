//
//  MKDensityUnit.m
//  UnitCoverter
//
//  Created by InSitu Pro on 21/7/14.
//  Copyright (c) 2014 BGC. All rights reserved.
//

#import "MKDensityUnit.h"

@implementation MKDensityUnit

+ (instancetype)gramPerCubicCentimeter {
    static NSString *name   = @"gramPerCubicCentimeter";
    static NSString *symbol = @"g/cm3";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)poundPerGallon {
    static NSString *name   = @"poundPerGallon";
    static NSString *symbol = @"lbm/gal";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:119826427 exponent:-9 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKDensityUnit)

+ (instancetype)density_gramPerCubicCentimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKDensityUnit gramPerCubicCentimeter]];
}

+ (instancetype)density_poundPerGallonlWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKDensityUnit poundPerGallon]];
}

@end

@implementation NSNumber (MKDensityUnit)

- (MKQuantity *)density_gramPerCubicCentimeter {
    return [MKQuantity density_gramPerCubicCentimeterWithAmount:self];
}

- (MKQuantity *)density_poundPerGallon {
    return [MKQuantity density_poundPerGallonlWithAmount:self];
}

@end