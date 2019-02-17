//
//  Employee.h
//  Assignment1
//
//  Created by Amuri Arun Kumar on 2/17/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject
@property (readonly, copy) NSString* name;
@property (readonly) NSUInteger birthYear;
@property (readonly, copy) NSDecimalNumber* salary;
@property (nonatomic, copy) NSString* salInCurrencyFormat;
- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear;
- (NSString*)updateSalaryCurrnecy:(Employee*)emp;
@end

NS_ASSUME_NONNULL_END
