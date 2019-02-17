//
//  EmployeeDirectory.h
//  Assignment1
//
//  Created by Amuri Arun Kumar on 2/17/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//extern NSString* const kEmployeeDirectoryDidUpdateNotification;
@interface EmployeeDirectory : NSObject
@property (readonly) NSArray* employees; // returns NSArray of Employee
@property (readonly) BOOL isUpdating;
- (void)update;
@end

NS_ASSUME_NONNULL_END
