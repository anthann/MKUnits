//
//  MKDensityUnit.h
//  UnitCoverter
//
//  Created by InSitu Pro on 21/7/14.
//  Copyright (c) 2014 BGC. All rights reserved.
//

#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKDensityUnit : MKUnit

+ (instancetype)gramPerCubicCentimeter;
+ (instancetype)poundPerGallon;

@end

@interface MKQuantity (MKDensityUnit)

+ (instancetype)density_gramPerCubicCentimeterWithAmount:(NSNumber *)amount;
+ (instancetype)density_poundPerGallonlWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKDensityUnit)

- (MKQuantity *)density_gramPerCubicCentimeter;
- (MKQuantity *)density_poundPerGallon;

@end