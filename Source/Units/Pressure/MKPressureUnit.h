//
//  MKPressureUnit.h
//  UnitCoverter
//
//  Created by InSitu Pro on 21/7/14.
//  Copyright (c) 2014 BGC. All rights reserved.
//

#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKPressureUnit : MKUnit

+ (instancetype)psi;
+ (instancetype)kilopascal;

@end

@interface MKQuantity (MKPressureUnit)

+ (instancetype)pressure_psiWithAmount:(NSNumber *)amount;
+ (instancetype)pressure_kilopascalWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKPressureUnit)

- (MKQuantity *)pressure_psi;
- (MKQuantity *)pressure_kilogram;

@end