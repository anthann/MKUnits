//
//  MKPressureUnit.m
//  UnitCoverter
//
//  Created by InSitu Pro on 21/7/14.
//  Copyright (c) 2014 BGC. All rights reserved.
//

#import "MKPressureUnit.h"

@implementation MKPressureUnit

+ (instancetype)psi {
    static NSString *name   = @"psi";
    static NSString *symbol = @"psi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:6894757293 exponent:-9 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kilopascal {
    static NSString *name   = @"kilopascal";
    static NSString *symbol = @"kPa";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKPressureUnit)

+ (instancetype)pressure_psiWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKPressureUnit psi]];
}

+ (instancetype)pressure_kilopascalWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKPressureUnit kilopascal]];
}

@end

@implementation NSNumber (MKPressureUnit)

- (MKQuantity *)pressure_psi {
    return [MKQuantity pressure_psiWithAmount:self];
}

- (MKQuantity *)pressure_kilogram {
    return [MKQuantity pressure_kilopascalWithAmount:self];
}


@end
