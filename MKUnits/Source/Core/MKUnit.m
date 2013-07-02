//
//  MKUnit.m
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit.h"
#import "MKMacros.h"

#import "NSDecimalNumber+Negative.h"

//NSString * const UNITS_NOT_CONVERTIBLE = @"Units not convertible.";

@implementation MKUnit

//+ (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to {
//    return [[self _default] convertAmount:amount from:from to:to];
//}
//
//+ (instancetype)_default {
//    return [self createWithName:@"Unit"
//                     withSymbol:@"u"
//                      withRatio:[NSDecimalNumber one]];
//}

+ (instancetype)createWithName:(NSString *)name
                    withSymbol:(NSString *)symbol
                     withRatio:(NSDecimalNumber *)ratio {
    return [[self alloc] initWithName:name withSymbol:symbol withRatio:ratio];
}

- (id)initWithName:(NSString *)name
        withSymbol:(NSString *)symbol withRatio:(NSDecimalNumber *)ratio {
    if (self = [super init]) {
        self.name = name;
        self.symbol = symbol;
        self.ratio = ratio;
    }
    return self;
}

- (id)init {
    METHOD_USE_DESIGNATED_INIT
}

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] createWithName:[self.name copyWithZone:zone]
                             withSymbol:[self.symbol copyWithZone:zone]
                              withRatio:[self.ratio copyWithZone:zone]];
}

//- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)unit {
//    return [self convertAmount:amount from:unit to:self];
//}
//
//- (NSNumber *)convertAmount:(NSNumber *)amount to:(MKUnit *)unit {
//    return [self convertAmount:amount from:self to:unit];
//}
//
//- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to {
//    NSAssert([from isConvertibleWith:to], UNITS_NOT_CONVERTIBLE);
//    
//    id baseAmount = [from convertToBaseUnit:amount];
//    id converted = [to convertFromBaseUnit:baseAmount];
//    return converted;
//}

//- (BOOL)isConvertibleWith:(MKUnit *)unit {
//    return [unit isMemberOfClass:[self class]];
//}

- (NSNumber *)convertFromBaseUnit:(NSNumber *)amount {
    id value = [NSDecimalNumber createFrom:amount];
    return [value decimalNumberByDividingBy:self.ratio];
}

- (NSNumber *)convertToBaseUnit:(NSNumber *)amount {
    id value = [NSDecimalNumber createFrom:amount];
    return [value decimalNumberByMultiplyingBy:self.ratio];
}

- (NSString *)description {
    return self.symbol;
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[self class]]) return NO;
    return ([self.symbol isEqualToString:[object symbol]]);
}

- (NSUInteger)hash {
    return [[NSString stringWithFormat:@"%@%@", [self class], self.symbol] hash];
}

@end
