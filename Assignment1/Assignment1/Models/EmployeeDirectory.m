//
//  EmployeeDirectory.m
//  Assignment1
//
//  Created by Amuri Arun Kumar on 2/17/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

#import "EmployeeDirectory.h"
#import "Employee.h"
@implementation EmployeeDirectory

- (void)update
{
    if(_isUpdating == YES){
        return;
        
    }
    _isUpdating = YES;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self BA_doUpdateInBackground];
    });
}
#pragma mark - Privates
- (void)BA_doUpdateInBackground
{

    [NSThread sleepForTimeInterval:2];
    NSArray* name = @[@"Anne", @"Lucas", @"Marc", @"Zeus", @"Hermes", @"Bart", @"Paul", @"John",
                      @"Ringo", @"Dave", @"Taylor"];
    NSArray* surnames = @[@"Hawkins", @"Simpson", @"Lennon", @"Grohl", @"Hawkins", @"Jacobs",
                          @"Holmes", @"Mercury", @"Matthews"];
    NSUInteger amount = name.count*surnames.count;
    NSMutableArray* employees = [NSMutableArray arrayWithCapacity:amount];
    for(NSUInteger i=0; i<amount; i++){
        NSString* fullName = [NSString stringWithFormat:@"%@ %@", name[random()%name.count],
                              surnames[random()%surnames.count]];
        [employees addObject:[[Employee alloc] initWithName:fullName birthYear:1997-random()%50]];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self BA_updateDidFinishWithResults:employees];
    });
}
- (void)BA_updateDidFinishWithResults:(NSArray*)results
{
    _employees = results;
    _isUpdating = NO;
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"kEmployeeDirectoryDidUpdateNotification" object:self];
}

@end
