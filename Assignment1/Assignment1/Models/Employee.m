//
//  Employee.m
//  Assignment1
//
//  Created by Amuri Arun Kumar on 2/17/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

#import "Employee.h"

@implementation Employee
static NSUInteger const kStartingSalary = 10000;
NSString* const kSalaryCurrency = @"EUR";
- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear
{
    self = [super init];
    if(self)
    {
        _name = name;
        _birthYear = birthYear;
        _salary = [[NSDecimalNumber alloc] initWithUnsignedInteger:kStartingSalary];
//        SEL selector = NSSelectorFromString(@"updateSalaryCurrnecy:");
//        if ([self respondsToSelector:selector]) {
//            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
//                                        [[self class] instanceMethodSignatureForSelector:@selector(updateSalaryCurrnecy:)]];
//            [invocation setSelector:selector];
//            [invocation setTarget:self];
//            [invocation invoke];
//            NSString* returnValue;
//            [invocation getReturnValue:&returnValue];
//            self.salInCurrencyFormat = returnValue;
//            NSLog(@"Returned %@", returnValue);
//        }
    }
    return self;
}
- (void)updateSalaryCurrnecy{
    
}
- (NSString*)updateSalaryCurrnecy:(NSDecimalNumber*)salary{
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc]init];
    numFormatter.allowsFloats = YES;
    numFormatter.currencyCode = kSalaryCurrency;
    numFormatter.groupingSize = 3;
    numFormatter.maximumFractionDigits = 2;
    numFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    return [numFormatter stringFromNumber:self.salary];
}
@end
